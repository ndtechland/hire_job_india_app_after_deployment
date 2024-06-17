import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:http/http.dart' as http;
//import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewerPage extends StatefulWidget {
  final File file;
  final String url;

  const PdfViewerPage({
    Key? key,
    required this.file,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          if (widget.url.isNotEmpty)
            IconButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                bool success = await saveFile(widget.url, basename(widget.url));
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Successfully saved to internal storage "PDF_Download" folder',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  // After successfully saving the file, open it
                  /// openPdf(widget.file.path);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to save the file',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              icon: Icon(Icons.download_rounded),
            ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: widget.file.path,
            ),
    );
  }

  Future<bool> saveFile(String url, String fileName) async {
    try {
      if (await _requestPermission(Permission.storage)) {
        Directory? directory =
            Directory('/storage/emulated/0/Download/PDF_Download');
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        File saveFile = File('${directory.path}/$fileName');
        if (kDebugMode) {
          print('Saving file to: ${saveFile.path}');
        }

        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;
          await saveFile.writeAsBytes(bytes, flush: true);
          if (kDebugMode) {
            print('File saved successfully: ${saveFile.path}');
          }
          return true;
        } else {
          if (kDebugMode) {
            print('Failed to download file: ${response.statusCode}');
          }
          return false;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving file: $e');
      }
      return false;
    }
    return false;
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }

  // void openPdf(String filePath) {
  //   OpenFile.open(filePath);
  // }
}
