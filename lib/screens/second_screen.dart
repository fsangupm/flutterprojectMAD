import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _textController = TextEditingController();
  String _fileContent = '';
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  Future<void> _loadFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/tasks.txt');
      _filePath = file.path;

      if (await file.exists()) {
        _fileContent = await file.readAsString();
        _textController.text = _fileContent;
      } else {
        await file.create();
      }

      setState(() {});
    } catch (e) {
      print('Error loading file: $e');
    }
  }

  Future<void> _saveFile() async {
    try {
      final file = File(_filePath);
      await file.writeAsString(_textController.text);
      setState(() {
        _fileContent = _textController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File saved successfully!')),
      );
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List (Screen One)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Tasks for Today'),
            Expanded(
              child: TextField(
                controller: _textController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter tasks...',
                ),
              ),
            ),
            Text('File Path: $_filePath', style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _saveFile,
              child: const Text('Save Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
