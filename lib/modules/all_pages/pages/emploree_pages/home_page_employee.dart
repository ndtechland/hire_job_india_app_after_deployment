import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/side_drower.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/support_comman_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/responsive_text.dart';
import '../../../../controllers/employeee_controllersss/employee_dashboard_controller/employee_dashboardcontroller.dart';
import '../../../../controllers/employeee_controllersss/employee_login_controllers/employee_login_controllers.dart';
import '../../../../controllers/employeee_controllersss/support_comman/support_commannn.dart';
import '../../../../controllers/user_profile_controller/user_profile_controller.dart';
import '../login.dart';

HomedashboardController _homedashboardController =
    Get.put(HomedashboardController());

SupportEmployeeController _supportEmployeeController =
    Get.put(SupportEmployeeController());

class HomeEmployee extends StatelessWidget {
  final RxBool isLoading = false.obs;

  static const String id = 'Categories';

  final List<String> image = [
    "lib/assets/images/c11.png",
    "lib/assets/images/c5.png",
    "lib/assets/images/c77.png",
    "lib/assets/images/c44.png",
    "lib/assets/images/c33.png",
    "lib/assets/images/c88.png",
    //"lib/assets/images/12.png",
    //'lib/assets/images/totalleave.png',
    //'lib/assets/images/available_attandance.png',
    //  'lib/assets/images/totalleave.png',
    // 'lib/assets/images/monthsLeaves.png',
    // 'lib/assets/images/salaryslip.png',
    // 'lib/assets/images/c2.png',
    // 'lib/assets/images/c3.png',
    // 'lib/assets/images/c4.png',
  ];

  final List<String> name = [
    'Total Leaves',
    'Total Attendance',
    'Profile',
    'Leave Left',
    'Current Month Attendance',
    'Support',
  ];
  EmployeeLoginController _employeeloginController =
      Get.put(EmployeeLoginController());

  final snackBarDuration = Duration(seconds: 3); // Define your desired duration

  final ProfileController _profileController = Get.put(ProfileController());

  // Colors for images and containers
  // final List<Color> imageColors = [
  //   Color(0xffee6c4d),
  //   Colors.yellow,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.purple,
  //   Colors.teal,
  //   //Colors.pink,
  // ];

  final List<Color> containerColors = [
    Color(0xffee6c4d),
    Colors.cyan,
    Colors.green,
    Colors.blue.shade700,
    Colors.purple,
    Colors.cyan,
  ];

  HomeEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: EmployeeNavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Hire Job India"
            //  "${_homedashboardController.dashboardResponse?.data?.totalAttendance}"
            ),
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                _employeeloginController.onInit();

                await Future.delayed(Duration(seconds: 1));

                SharedPreferences.getInstance().then((prefs) => prefs.clear());

                // Hide loading dialog
                Get.back();

                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Login()));

                // Navigate to login screen
                Get.offAll(() => Login());
                // Show success snackbar
                Get.snackbar(
                  'Success',
                  'Successfully logged out',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  duration: snackBarDuration, // Set the duration
                );
                // Start the timer
                // Timer(Duration(seconds: 2), () async {
                //   final accountData = await accountService.getAccountData;
                //   print("AccountData: $accountData");
                //
                //   if (accountData == null) {
                //     await _profileController.profileApi();
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => SliderScreen()),
                //     );
                //   } else {
                //     await _profileController.profileApi();
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => Home()),
                //     );
                //   }
                // });
                //Get.to(Home());
              },
              icon: const Icon(Icons.logout)),
        ],
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[logoColor, logoColor]),
          ),
        ),
        elevation: 0,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return LayoutBuilder(builder: (context, constraints) {
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;

          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.55
              : screenWidth * 0.25;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.2
              : screenHeight * 0.5;

          var imageWidth2 = orientation == Orientation.portrait
              ? screenWidth * 0.55
              : screenWidth * 0.19;
          var imageHeight2 = orientation == Orientation.portrait
              ? screenHeight * 0.32
              : screenHeight * 0.5;

          var categoryWidth = orientation == Orientation.portrait
              ? screenWidth * 0.5
              : screenWidth * 0.3;
          var categoryHeight = orientation == Orientation.portrait
              ? screenHeight * 0.12
              : screenHeight * 0.37;

          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[0 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: Container(
                                      height: imageHeight * 0.5,
                                      width: imageWidth * 0.34,
                                      child: image[0] != null
                                          ? Image.asset(
                                              image[0], fit: BoxFit.cover,
                                              //color: Colors.white,
                                              // imageColors[
                                              //     index % imageColors.length],
                                              // fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'lib/assets/logo/noimageavlble.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[0]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text:
                                                    ("${_homedashboardController.dashboardResponse?.data?.leave}"),
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    0 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[1 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: Container(
                                      height: imageHeight * 0.5,
                                      width: imageWidth * 0.34,
                                      child: image[1] != null
                                          ? Image.asset(
                                              image[1], fit: BoxFit.cover,
                                              // color: imageColors[
                                              //     index % imageColors.length],
                                              // fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'lib/assets/logo/noimageavlble.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[1]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text:
                                                    ("${_homedashboardController.dashboardResponse?.data?.totalAttendance}"),
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    1 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[2 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: Container(
                                      height: imageHeight * 0.5,
                                      width: imageWidth * 0.34,
                                      child: image[2] != null
                                          ? Image.asset(
                                              image[2], fit: BoxFit.cover,
                                              // color: imageColors[
                                              //     index % imageColors.length],
                                              // fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'lib/assets/logo/noimageavlble.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[2]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text:
                                                    ("${_homedashboardController.dashboardResponse?.data?.completionPercentage}\nCompleted"),
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    2 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[3 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: Container(
                                      height: imageHeight * 0.5,
                                      width: imageWidth * 0.34,
                                      child: image[3] != null
                                          ? Image.asset(
                                              image[3], fit: BoxFit.cover,
                                              // color: imageColors[
                                              //     index % imageColors.length],
                                              // fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'lib/assets/logo/noimageavlble.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[3]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text:
                                                    ("${_homedashboardController.dashboardResponse?.data?.leaveLeft}"),
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    3 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[4 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: Container(
                                      height: imageHeight * 0.5,
                                      width: imageWidth * 0.34,
                                      child: image[4] != null
                                          ? Image.asset(
                                              image[4], fit: BoxFit.cover,
                                              // color: imageColors[
                                              //     index % imageColors.length],
                                              // fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'lib/assets/logo/noimageavlble.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[4]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text:
                                                    ("${_homedashboardController.dashboardResponse?.data?.attendance}"),
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    4 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () async {
                              _supportEmployeeController.supportemployeeApi();
                              _supportEmployeeController.update();
                              await Future.delayed(Duration(milliseconds: 800));

                              Get.to(SupportViewHirejobComman());

                              //Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //   builder: (context) => const CompanyDetail(),
                              // ),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    containerColors[5 % containerColors.length],
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: imageWidth * 0.01,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: imageHeight * 0.57,
                                        width: imageWidth * 0.44,
                                        child: image[5] != null
                                            ? Image.asset(
                                                image[5], fit: BoxFit.cover,
                                                // color: imageColors[
                                                //     index % imageColors.length],
                                                // fit: BoxFit.fill,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'lib/assets/logo/noimageavlble.jpg',
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              )
                                            : Image.network(
                                                'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responsiveText(
                                          context: context,
                                          text: (name[5]),
                                          fontSizePortrait: 16,
                                          fontSizeLandscape: 14,
                                          color: Colors.white,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: imageHeight2 * 0.45,
                                            width: imageWidth2 * 0.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: responsiveText(
                                                context: context,
                                                text: "24*7\n Available",
                                                fontSizePortrait: 19,
                                                fontSizeLandscape: 19,
                                                color: containerColors[
                                                    5 % containerColors.length],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
