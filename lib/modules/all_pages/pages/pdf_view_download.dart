import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfViewScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  String? localPath;
  bool isDownloading = false;
  bool isDownloaded = false;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  Future<void> _prepare() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final externalDir = await getExternalStorageDirectory();
      localPath = '${externalDir?.path}/${widget.pdfUrl.split('/').last}';

      // Check if the file already exists to avoid re-downloading it
      final file = File(localPath!);
      if (await file.exists()) {
        setState(() {
          isDownloaded = true;
        });
      }
    } else {
      print('Permission denied');
    }
  }

  void _downloadPdf() async {
    setState(() {
      isDownloading = true;
    });

    final status = await Permission.storage.request();

    if (status.isGranted) {
      final downloadDir = await getExternalStorageDirectory();
      final downloadPath =
          '${downloadDir?.path}/${widget.pdfUrl.split('/').last}';

      final taskId = await FlutterDownloader.enqueue(
        url: widget.pdfUrl,
        savedDir: downloadDir!.path,
        fileName: widget.pdfUrl.split('/').last,
        showNotification: true,
        openFileFromNotification: true,
      );

      // Monitor download progress and completion
      FlutterDownloader.registerCallback((id, status, progress) {
        if (taskId == id && status == DownloadTaskStatus.complete) {
          setState(() {
            localPath = downloadPath;
            isDownloading = false;
            isDownloaded = true;
          });
        } else if (status == DownloadTaskStatus.failed) {
          setState(() {
            isDownloading = false;
          });
          print('Download failed');
        }
      });
    } else {
      print('Permission denied');
      setState(() {
        isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          isDownloading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.download),
                  onPressed: _downloadPdf,
                ),
        ],
      ),
      body: isDownloaded && localPath != null
          ? PDFView(
              filePath: localPath!,
              onRender: (_pages) {
                print('PDF rendered, number of pages: $_pages');
              },
              onError: (error) {
                print('Error occurred while rendering PDF: $error');
              },
              onPageError: (page, error) {
                print('Error occurred on page: $page, error: $error');
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
