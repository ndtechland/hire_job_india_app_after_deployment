import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/responsive_text.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/view_pdf_only.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../controllers/employee_controller/profile_controller/profile_info_employee_controller.dart';

class BankDetailEmployeeProfile extends StatelessWidget {
  final ProfileEmployeeController _getprofileebnk =
      Get.put(ProfileEmployeeController());

  // static const String id = 'Profile';

  BankDetailEmployeeProfile({Key? key}) : super(key: key);
  //GetProfileModel? getprofileModel;

  int selectID = 1;
  String dropdownValueDay = '2';
  String dropdownValueMonth = 'July';
  String dropdownValueYear = '1990';
  String dropdownValueCountry = 'India';
  String dropdownValueZip = '110096';

  // final TextEditingController _nameController = TextEditingController(
  //     // text: _getprofilee.getprofileModel.response.fullName
  //     );

  @override
  Widget build(BuildContext context) {
    // String imageUrl =
    //     "${FixedText.apiurl2}${_getprofileebasic.getbasicemployeeModel?.data?.profileImage}";
    // print("imageUrl");
    // print(imageUrl);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: Obx(
        () => (_getprofileebnk.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // _buildHeader(context),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blackHeadingSmall('Bank Information'.toUpperCase()),
                          // GestureDetector(
                          //     onTap: () {}, child: appcolorText('Edit')
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Column(
                        children: [
                          responsiveContainer2(
                            heightPortrait:
                                MediaQuery.of(context).size.height * 0.055,
                            widthPortrait: MediaQuery.of(context).size.width,
                            heightLandscape:
                                MediaQuery.of(context).size.height * 0.09,
                            widthLandscape: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "A/C Holder Name:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileebnk.getbankprofiledetail?.data?.accountHolderName.toString()}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),

                          ///
                          responsiveContainer2(
                            heightPortrait:
                                MediaQuery.of(context).size.height * 0.055,
                            widthPortrait: MediaQuery.of(context).size.width,
                            heightLandscape:
                                MediaQuery.of(context).size.height * 0.09,
                            widthLandscape: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height *
                            //     0.05, // 20% of screen height if not provided
                            // width: MediaQuery.of(context).size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "BankName:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileebnk.getbankprofiledetail?.data?.bankName.toString()}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),

                          ///
                          responsiveContainer2(
                            heightPortrait:
                                MediaQuery.of(context).size.height * 0.055,
                            widthPortrait: MediaQuery.of(context).size.width,
                            heightLandscape:
                                MediaQuery.of(context).size.height * 0.09,
                            widthLandscape: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height *
                            //     0.05, // 20% of screen height if not provided
                            // width: MediaQuery.of(context).size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "A/C Number:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileebnk.getbankprofiledetail?.data?.accountNumber.toString()}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),

                          ///
                          responsiveContainer2(
                            heightPortrait:
                                MediaQuery.of(context).size.height * 0.055,
                            widthPortrait: MediaQuery.of(context).size.width,
                            heightLandscape:
                                MediaQuery.of(context).size.height * 0.09,
                            widthLandscape: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height *
                            //     0.05, // 20% of screen height if not provided
                            // width: MediaQuery.of(context).size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "IFSC Code:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileebnk.getbankprofiledetail?.data?.ifsc.toString()}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),

                          responsiveContainer2(
                            heightPortrait:
                                MediaQuery.of(context).size.height * 0.055,
                            widthPortrait: MediaQuery.of(context).size.width,
                            heightLandscape:
                                MediaQuery.of(context).size.height * 0.09,
                            widthLandscape: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height *
                            //     0.05, // 20% of screen height if not provided
                            // width: MediaQuery.of(context).size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "EPF Number:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileebnk.getbankprofiledetail?.data?.epfNumber.toString()}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),

                          ///

                          const SizedBox(height: 10),
                        ],
                      ),
                    ),

                    ///education
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       blackHeadingSmall('Education'.toUpperCase()),
                    //       GestureDetector(
                    //           onTap: () {}, child: appcolorText('Edit'))
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 0, horizontal: 16),
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 0, horizontal: 16),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 20.0,
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       textFieldNo('College'),
                    //       textFieldNo('High School Degree'),
                    //       textFieldNo('Higher Secondary Education'),
                    //       const SizedBox(height: 10),
                    //     ],
                    //   ),
                    // ),
                    ///education end
                    ///
                    /// skills
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       blackHeadingSmall('Skills'.toUpperCase()),
                    //       GestureDetector(
                    //           onTap: () {}, child: appcolorText('Edit'))
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 16, horizontal: 16),
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 0, horizontal: 16),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 20.0,
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    //   ),
                    //   child: Wrap(
                    //     children: [
                    //       _buildSkils('Flutter'),
                    //       _buildSkils('React'),
                    //       _buildSkils('Kotlin'),
                    //       _buildSkils('.Net'),
                    //       _buildSkils('Java'),
                    //       _buildSkils('Python'),
                    //       _buildSkils('PHP'),
                    //     ],
                    //   ),
                    // ),
                    ///skills end..
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       blackHeadingSmall('My Resume'.toUpperCase()),
                    //       GestureDetector(
                    //           onTap: () {}, child: appcolorText('Edit'))
                    //     ],
                    //   ),
                    // ),
                    ///
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 16, horizontal: 16),
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 0, horizontal: 16),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 20.0,
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Image.asset('lib/assets/images/c3.png',
                    //           width: 40, height: 40, color: Colors.black38),
                    //       const SizedBox(width: 10),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             boldText(
                    //               "${_getprofileepersonal.getprofileemployeeModel?.data?.personalEmailAddress}",
                    //             ),
                    //             //boldText('Kumar Prince CV'),
                    //
                    //             responsiveText2(
                    //               text:
                    //               "${_getprofileepersonal.getprofileemployeeModel?.data?.}",
                    //               fontSizeLandscape:
                    //                   MediaQuery.of(context).size.height * 0.03,
                    //               fontSizePortrait:
                    //                   MediaQuery.of(context).size.height *
                    //                       0.016,
                    //               // style: TextStyle(
                    //               //     fontSize: 12,
                    //               //     fontFamily: 'medium',
                    //               //     color: Colors.black),
                    //               context: context,
                    //               //text: '',
                    //             ),
                    //
                    //             //urlname
                    //           ],
                    //         ),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () async {
                    //           // Call the API to fetch profile information
                    //           _getprofilee.profileApi();
                    //           // Update UI after fetching profile information
                    //           _getprofilee.update();
                    //
                    //           // Get the URL of the PDF file from the profile information
                    //           final String? url = _getprofilee
                    //               .getprofileModel?.response?.resumeFilePath
                    //               ?.toString();
                    //
                    //           if (url != null) {
                    //             showDialog(
                    //               context: context,
                    //               barrierDismissible:
                    //                   false, // Prevent dismissing dialog by tapping outside
                    //               builder: (BuildContext context) {
                    //                 return AlertDialog(
                    //                   content: Column(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                       CircularProgressIndicator(), // Circular loader
                    //                       SizedBox(height: 10),
                    //                       Text(
                    //                           'Loading PDF....'), // Text indicating download process
                    //                     ],
                    //                   ),
                    //                 );
                    //               },
                    //             );
                    //
                    //             try {
                    //               // Load the PDF file from the network
                    //               final file = await loadPdfFromNetwork(url);
                    //               Navigator.pop(
                    //                   context); // Close the loading dialog
                    //
                    //               if (file != null) {
                    //                 // Open the PDF viewer page
                    //                 openPdf(context, file, url);
                    //               } else {
                    //                 // Handle error if file loading failed
                    //                 showDialog(
                    //                   context: context,
                    //                   builder: (context) => AlertDialog(
                    //                     title: Text('Error'),
                    //                     content:
                    //                         Text('Failed to load PDF file.'),
                    //                     actions: [
                    //                       TextButton(
                    //                         onPressed: () =>
                    //                             Navigator.pop(context),
                    //                         child: Text('OK'),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 );
                    //               }
                    //             } catch (e) {
                    //               print('Error downloading PDF: $e');
                    //               Navigator.pop(
                    //                   context); // Close the loading dialog
                    //               // Handle error if downloading fails
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (context) => AlertDialog(
                    //                   title: Text('Error'),
                    //                   content:
                    //                       Text('Failed to download PDF file.'),
                    //                   actions: [
                    //                     TextButton(
                    //                       onPressed: () =>
                    //                           Navigator.pop(context),
                    //                       child: Text('OK'),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               );
                    //             }
                    //           } else {
                    //             // Handle error if URL is null
                    //             showDialog(
                    //               context: context,
                    //               builder: (context) => AlertDialog(
                    //                 title: Text('Error'),
                    //                 content: Text('URL is null.'),
                    //                 actions: [
                    //                   TextButton(
                    //                     onPressed: () => Navigator.pop(context),
                    //                     child: Text('OK'),
                    //                   ),
                    //                 ],
                    //               ),
                    //             );
                    //           }
                    //         },
                    //         child: Icon(Icons.document_scanner_sharp,
                    //             size: 23, color: appColor2),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }

  ///pdf:downlload...
  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return null;
    return File(result.paths.first ?? '');
  }

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

  //final file = File('example.pdf');
  //await file.writeAsBytes(await pdf.save());

  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
          ),
        ),
      );
}
