import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String? _selectedActivity;

  final List<String> _activities = [
    'Work',
    'Leisure',
    'Eat',
    'Commute',
    'Sleep',
  ];

  Future<void> _logActivity() async {
    if (_selectedActivity == null) return;

    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

    await DatabaseHelper.instance.insertActivity(_selectedActivity!, timestamp);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Activity '$_selectedActivity' logged at $timestamp")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Logger')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Select Activity:'),
            ..._activities.map((activity) {
              return RadioListTile<String>(
                title: Text(activity),
                value: activity,
                groupValue: _selectedActivity,
                onChanged: (value) {
                  setState(() {
                    _selectedActivity = value;
                  });
                },
              );
            }),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _logActivity,
              child: const Text('Log Activity'),
            ),
          ],
        ),
      ),
    );
  }
}
