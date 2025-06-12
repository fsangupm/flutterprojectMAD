import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class GpsTrackerScreen extends StatefulWidget {
  @override
  _GpsTrackerScreenState createState() => _GpsTrackerScreenState();
}

class _GpsTrackerScreenState extends State<GpsTrackerScreen> {
  bool isTracking = false;
  StreamSubscription<Position>? _positionStream;
  List<String> _locations = [];
  File? _csvFile;

  @override
  void initState() {
    super.initState();
    _initCsvFile();
  }

  Future<void> _initCsvFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/gps_coordinates.csv';
    _csvFile = File(path);
    if (!await _csvFile!.exists()) {
      await _csvFile!.writeAsString('timestamp;latitude;longitude;altitude\n');
    }
  }

  Future<bool> _checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission != LocationPermission.denied && permission != LocationPermission.deniedForever;
  }

  void _toggleTracking(bool value) async {
    final hasPermission = await _checkPermissions();
    if (!hasPermission) return;

    setState(() => isTracking = value);

    if (value) {
      _positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 10,
        ),
      ).listen((Position position) async {
        final timestamp = DateFormat('yyyyMMdd HH:mm:ss').format(DateTime.now());
        final entry = '$timestamp;${position.latitude};${position.longitude};${position.altitude}\n';

        setState(() => _locations.insert(0, entry));
        await _csvFile?.writeAsString(entry, mode: FileMode.append);
      });
    } else {
      await _positionStream?.cancel();
      _positionStream = null;
    }
  }

  void _shareCsvFile() async {
    if (_csvFile != null && await _csvFile!.exists()) {
      await Share.shareXFiles([XFile(_csvFile!.path)], text: 'GPS coordinates exported from the app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPS Tracker')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Track Location'),
            value: isTracking,
            onChanged: _toggleTracking,
          ),
          ElevatedButton(
            onPressed: _shareCsvFile,
            child: const Text('Share CSV File'),
          ),
          const Divider(),
          const Text('Location Updates:', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_locations[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}
