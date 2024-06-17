import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../components/styles.dart';
import '../../../../constants/static_text.dart';
import '../../../../controllers/employeee_controllersss/salary_slip_controller/salary_slip_controllerss.dart';
import '../../../../widget/elevated_button.dart';
import '../view_pdf_only.dart';
import 'home_page_employee.dart';

class AllSalarySlip extends StatelessWidget {
  static const String id = 'AppliedJobs';
  final RxBool isLoading = false.obs;

  AllSalarySlip({Key? key}) : super(key: key);

  final AllSalarySlipController _allSalarySlipController =
      Get.put(AllSalarySlipController());

  String stripHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('View Salary Slip'),
        centerTitle: true,
        titleSpacing: 0,
        leading: InkWell(
            onTap: () {
              Get.to(HomeEmployee());
            },
            child: const Icon(Icons.arrow_back)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[logoColor, logoColor],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              var screenWidth = constraints.maxWidth;
              var screenHeight = constraints.maxHeight;

              var imageWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.55
                  : screenWidth * 0.3;
              var imageHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.4;

              var textfieldWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.83
                  : screenWidth * 0.45;
              var textfieldHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.3;

              var textfieldWidth2 = orientation == Orientation.portrait
                  ? screenWidth * 0.84
                  : screenWidth * 0.87;
              var textfieldHeight2 = orientation == Orientation.portrait
                  ? screenHeight * 0.15
                  : screenHeight * 0.4;

              return Obx(
                () => (_allSalarySlipController.isLoading.value ||
                        isLoading.value)
                    ? const Center(child: CircularProgressIndicator())
                    : SafeArea(
                        child: Column(
                          children: [
                            Container(
                              height: imageHeight * 0.5,
                              color: logoColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 3),
                              child: SizedBox(
                                width: screenWidth * 0.97,
                                height: screenHeight * 0.14,
                                child: TextField(
                                  cursorColor: appColor,
                                  onChanged: (value) => _allSalarySlipController
                                      .filterSalarySlips(value),
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: appColor),
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.search, color: appColor),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Enter Month-Year.',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 13.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: appColor),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: appColor),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            _allSalarySlipController.foundSalarySlips.isEmpty
                                ? const Center(child: Text("No Slip Found"))
                                : Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _allSalarySlipController
                                          .foundSalarySlips.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final salarySlip =
                                            _allSalarySlipController
                                                .foundSalarySlips[index];
                                        final packageText = salarySlip
                                                    .salarySlipName?.isEmpty ??
                                                true
                                            ? "Not disclosed"
                                            : salarySlip.salarySlipName!;
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 16),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 20.0,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      // isLoading.value = true;
                                                      // SharedPreferences prefs =
                                                      //     await SharedPreferences
                                                      //         .getInstance();
                                                      // prefs.setString(
                                                      //   "salaryListId",
                                                      //   salarySlip.id
                                                      //       .toString(),
                                                      // );
                                                      // await Future.delayed(
                                                      //     const Duration(
                                                      //         seconds: 0));
                                                      // isLoading.value = false;
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          right: 0, left: 4),
                                                      height:
                                                          textfieldHeight * 0.4,
                                                      width:
                                                          textfieldWidth * 0.19,
                                                      child: Image.network(
                                                        FixedText.imgurl +
                                                            salarySlip
                                                                .salarySlipName
                                                                .toString(),
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return Image.asset(
                                                            'lib/assets/images/slippp.png',
                                                            width: screenWidth *
                                                                0.34,
                                                            height:
                                                                screenHeight *
                                                                    0.16,
                                                            // width: 20,
                                                            // height: 30,
                                                            fit: BoxFit.fill,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: blackHeadingSmall(
                                                        salarySlip
                                                            .salarySlipName
                                                            .toString()),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.04),
                                                    child:

                                                        ///
                                                        // GestureDetector(
                                                        //   onTap: () async {
                                                        //     // _allSalarySlipController
                                                        //     //     .fetchSalarySlips();
                                                        //     // _allSalarySlipController
                                                        //     //     .update();
                                                        //
                                                        //     BuildContext
                                                        //         dialogContext =
                                                        //         context;
                                                        //
                                                        //     // final parentContext =
                                                        //     //     context; // Store the current context
                                                        //
                                                        //     // Get the URL of the PDF file from the profile information
                                                        //     String url =
                                                        //         "${FixedText.offaptpdfurl}${_allSalarySlipController.foundSalarySlips[index].salarySlipPath.toString()}";
                                                        //     print("url");
                                                        //     print(url);
                                                        //
                                                        //     // Show a loading indicator
                                                        //     showDialog(
                                                        //       context:
                                                        //           dialogContext,
                                                        //       builder: (BuildContext
                                                        //           context) {
                                                        //         return AlertDialog(
                                                        //           content: Column(
                                                        //             mainAxisSize:
                                                        //                 MainAxisSize
                                                        //                     .min,
                                                        //             children: [
                                                        //               CircularProgressIndicator(),
                                                        //               SizedBox(
                                                        //                   height:
                                                        //                       10),
                                                        //               Text(
                                                        //                   'Loading salary slip letter...'),
                                                        //             ],
                                                        //           ),
                                                        //         );
                                                        //       },
                                                        //     );
                                                        //
                                                        //     try {
                                                        //       final file =
                                                        //           await loadPdfFromNetwork(
                                                        //               url);
                                                        //       Navigator.pop(
                                                        //           dialogContext); // Close the loading dialog using the captured context
                                                        //
                                                        //       if (file != null) {
                                                        //         openPdf(context,
                                                        //             file, url);
                                                        //       } else {
                                                        //         _showErrorDialog(
                                                        //             context,
                                                        //             'Failed to load PDF file.');
                                                        //       }
                                                        //     } catch (e) {
                                                        //       print(
                                                        //           'Error downloading PDF: $e');
                                                        //       Navigator.pop(
                                                        //           dialogContext); // Close the loading dialog using the captured context
                                                        //       _showErrorDialog(
                                                        //           context,
                                                        //           'Failed to download PDF file.');
                                                        //     }
                                                        //   },
                                                        //   child: Icon(Icons
                                                        //       .document_scanner_rounded),
                                                        // ),

                                                        ///

                                                        //     MyElevatedButton(
                                                        //   onPressed: () async {
                                                        //     // Get the current context before any asynchronous operation
                                                        //     final parentContext =
                                                        //         context;
                                                        //     // _allSalarySlipController
                                                        //     //     .fetchSalarySlips();
                                                        //     // _allSalarySlipController
                                                        //     //     .update();
                                                        //
                                                        //     // Get the URL of the PDF file from the profile information
                                                        //     String url =
                                                        //         "${FixedText.offaptpdfurl}${salarySlip.salarySlipPath}";
                                                        //
                                                        //     if (url != null) {
                                                        //       showDialog(
                                                        //         context:
                                                        //             parentContext, // Use the parentContext obtained above
                                                        //         barrierDismissible:
                                                        //             false,
                                                        //         builder:
                                                        //             (BuildContext
                                                        //                 context) {
                                                        //           return AlertDialog(
                                                        //             content: Column(
                                                        //               mainAxisSize:
                                                        //                   MainAxisSize
                                                        //                       .min,
                                                        //               children: [
                                                        //                 CircularProgressIndicator(),
                                                        //                 SizedBox(
                                                        //                     height:
                                                        //                         10),
                                                        //                 Text(
                                                        //                     'Loading salary slip letter...'),
                                                        //               ],
                                                        //             ),
                                                        //           );
                                                        //         },
                                                        //       );
                                                        //       try {
                                                        //         final file =
                                                        //             await loadPdfFromNetwork(
                                                        //                 url);
                                                        //         Navigator.pop(
                                                        //             parentContext); // Close the loading dialog
                                                        //
                                                        //         if (file != null) {
                                                        //           openPdf(
                                                        //               parentContext,
                                                        //               file,
                                                        //               url);
                                                        //         } else {
                                                        //           _showErrorDialog(
                                                        //               parentContext,
                                                        //               'Failed to load PDF file.');
                                                        //         }
                                                        //       } catch (e) {
                                                        //         print(
                                                        //             'Error downloading PDF: $e');
                                                        //         Navigator.pop(
                                                        //             parentContext); // Close the loading dialog
                                                        //         _showErrorDialog(
                                                        //             parentContext,
                                                        //             'Failed to download PDF file.');
                                                        //       }
                                                        //     } else {
                                                        //       _showErrorDialog(
                                                        //           parentContext,
                                                        //           'URL is null.');
                                                        //       Get.back();
                                                        //     }
                                                        //   },
                                                        //   text: btnText('View'),
                                                        //   height: 31,
                                                        //   width: 80,
                                                        // ),

                                                        ///
                                                        MyElevatedButton(
                                                      onPressed: () async {
                                                        // Get the current context before any asynchronous operation
                                                        final parentContext =
                                                            context;

                                                        // Get the URL of the PDF file from the profile information
                                                        String url =
                                                            "${FixedText.offaptpdfurl}${salarySlip.salarySlipPath}";

                                                        // Debug: Print the URL to ensure it's correct
                                                        print(
                                                            "Generated URL: $url");

                                                        if (url != null &&
                                                            Uri.tryParse(url)
                                                                    ?.hasAbsolutePath ==
                                                                true) {
                                                          // Show a loading indicator (you can use a different approach here)
                                                          final loadingOverlay =
                                                              OverlayEntry(
                                                            builder:
                                                                (context) =>
                                                                    Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          );
                                                          Overlay.of(
                                                                  parentContext)
                                                              ?.insert(
                                                                  loadingOverlay);

                                                          try {
                                                            final file =
                                                                await loadPdfFromNetwork(
                                                                    url);
                                                            loadingOverlay
                                                                .remove(); // Remove the loading overlay

                                                            if (file != null) {
                                                              openPdf(
                                                                  parentContext,
                                                                  file,
                                                                  url);
                                                            } else {
                                                              _showErrorDialog(
                                                                  parentContext,
                                                                  'Failed to load PDF file.');
                                                            }
                                                          } catch (e) {
                                                            print(
                                                                'Error downloading PDF: $e');
                                                            loadingOverlay
                                                                .remove(); // Remove the loading overlay
                                                            _showErrorDialog(
                                                                parentContext,
                                                                'Failed to download PDF file.');
                                                          }
                                                        } else {
                                                          _showErrorDialog(
                                                              parentContext,
                                                              'Invalid URL.');
                                                          Get.back();
                                                        }
                                                      },
                                                      text: btnText('View'),
                                                      height: 31,
                                                      width: 80,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }

  // Outside the ListView.builder
  void openPdf(BuildContext context, File file, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          file: file,
          url: url,
        ),
      ),
    );
  }

// Helper method to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  ///pdf:downlload...
  // Future<File?> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (result == null) return null;
  //   return File(result.paths.first ?? '');
  // }

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

//   void openPdf(BuildContext context, File file, String url) =>
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => PdfViewerPage(
//             file: file,
//             url: url,
//           ),
//         ),
//       );
//
// // Helper method to show error dialog
//   void _showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
}
