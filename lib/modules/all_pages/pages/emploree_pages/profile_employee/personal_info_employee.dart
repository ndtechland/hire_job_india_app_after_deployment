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

class PersonalProfile extends StatelessWidget {
  final ProfileEmployeeController _getprofileepersonal =
      Get.put(ProfileEmployeeController());

  // static const String id = 'Profile';

  PersonalProfile({Key? key}) : super(key: key);
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
    String imageUrl =
        // "${FixedText.apiurl2}$
        "${_getprofileepersonal.getprofileemployeeModel?.data?.profileImage}";
    print("imageUrl");
    print(imageUrl);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: Obx(
        () => (_getprofileepersonal.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blackHeadingSmall('Basic Informations'.toUpperCase()),
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
                                    "Name:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileepersonal.getprofileemployeeModel?.data?.name.toString()}",
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
                                    "Email:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileepersonal.getprofileemployeeModel?.data?.personalEmailAddress}",
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
                                    "Phone:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileepersonal.getprofileemployeeModel?.data?.mobileNumber}",
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
                                    "DOB:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_getprofileepersonal.getprofileemployeeModel?.data?.dateOfBirth}",
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blackHeadingSmall('Location'.toUpperCase()),
                          // GestureDetector(
                          //     onTap: () {}, child: appcolorText('Edit'))
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
                            // height: MediaQuery.of(context).size.height *
                            //     0.05, // 20% of screen height if not provided
                            // width: MediaQuery.of(context).size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "State:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  responsiveText(
                                    text:
                                        "${_getprofileepersonal.getprofileemployeeModel?.data?.statename}",
                                    fontSizeLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    fontSizePortrait:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    // style: TextStyle(
                                    //     fontSize: 12,
                                    //     fontFamily: 'medium',
                                    //     color: Colors.black),
                                    context: context,
                                    //text: '',
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
                                    "City:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  responsiveText(
                                    text:
                                        "${_getprofileepersonal.getprofileemployeeModel?.data?.cityname}",
                                    fontSizeLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    fontSizePortrait:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    // style: TextStyle(
                                    //     fontSize: 12,
                                    //     fontFamily: 'medium',
                                    //     color: Colors.black),
                                    context: context,
                                    //text: '',
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
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  responsiveText(
                                    text:
                                        "${_getprofileepersonal.getprofileemployeeModel?.data?.addressLine1}",
                                    fontSizeLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    fontSizePortrait:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    // style: TextStyle(
                                    //     fontSize: 12,
                                    //     fontFamily: 'medium',
                                    //     color: Colors.black),
                                    context: context,
                                    //text: '',
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
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Address 2:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'medium',
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  responsiveText(
                                    text:
                                        "${_getprofileepersonal.getprofileemployeeModel?.data?.addressLine2}",
                                    fontSizeLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    fontSizePortrait:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    // style: TextStyle(
                                    //     fontSize: 12,
                                    //     fontFamily: 'medium',
                                    //     color: Colors.black),
                                    context: context,
                                    //text: '',
                                  ),
                                ],
                              ),
                            ),
                            context: context,
                          ),
                          Divider(
                            color: appColor,
                          ),
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

  Widget _buildHeader(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor, appColor]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: responsiveContainer(
                  // padding: const EdgeInsets.only(right: 0),
                  //height: 20,
                  //width: 20,
                  heightPortrait: MediaQuery.of(context).size.height * 0.12,
                  widthPortrait: MediaQuery.of(context).size.width * 0.25,
                  heightLandscape: MediaQuery.of(context).size.height * 0.3,
                  widthLandscape: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height *
                  //     0.05, // 20% of screen height if not provided
                  // width: MediaQuery.of(context).size.width * 0.09,
                  //                                    "${_getprofileepersonal.getprofileemployeeModel?.data?.personalEmailAddress}",
                  child: _getprofileepersonal
                              .getprofileemployeeModel?.data?.profileImage !=
                          null
                      ? Image.network(
                          //"${FixedText.apiurl2}"
                          "${_getprofileepersonal.getprofileemployeeModel?.data?.profileImage}",
                          //color: appColor,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'lib/assets/logo/hirelogo11.png',
                              fit: BoxFit.fill,
                            );
                          },
                        )
                      : Image.network(
                          'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                          fit: BoxFit.fill,
                        ),
                  context: context,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${_getprofileepersonal.getprofileemployeeModel?.data?.name?.toString()}",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'medium', color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "${_getprofileepersonal.getprofileemployeeModel?.data?.personalEmailAddress?.toString()}",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 10),
          ],
        ));
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
