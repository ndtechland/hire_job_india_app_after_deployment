import 'package:file_picker/file_picker.dart'; // Optional for file access
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen33 extends StatefulWidget {
  @override
  _HomeScreen33State createState() => _HomeScreen33State();
}

class _HomeScreen33State extends State<HomeScreen33> {
  String? _filePath; // To store selected file path

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission already granted
      print('Storage permission granted');
    } else {
      // Request permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        print('Storage permission granted');
      } else if (status.isDenied) {
        print('Storage permission denied');
      } else if (status.isPermanentlyDenied) {
        print('Storage permission permanently denied');
        _showPermissionDeniedDialog();
      }
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Permissions Required'),
        content: Text('Please grant storage permission in app settings.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Opens app settings page
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx'
      ], // Optional: Specify allowed file types
    );
    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
        print('Selected file: $_filePath');
      });
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Permission Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectFile(),
              child: Text('Select File'),
            ),
            SizedBox(height: 16),
            _filePath != null
                ? Text('Selected File: $_filePath')
                : Text('No file selected'),
          ],
        ),
      ),
    );
  }
}
