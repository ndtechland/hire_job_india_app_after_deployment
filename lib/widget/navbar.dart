import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/applied_jobs.dart';
import 'package:hirejobindia/modules/all_pages/pages/bookmark.dart';
import 'package:hirejobindia/modules/all_pages/pages/categories.dart';
import 'package:hirejobindia/modules/all_pages/pages/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/responsive_text.dart';
import '../controllers/employeee_controllersss/support_comman/support_commannn.dart';
import '../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../controllers/login_controllers/login_controllersss.dart';
import '../controllers/registrationss/registration_controller.dart';
import '../controllers/user_profile_controller/user_profile_controller.dart';
import '../controllers/view_job_controller/aaplied_job_controller.dart';
import '../controllers/view_job_controller/saved_job_controller.dart';
import '../modules/all_pages/pages/change_password.dart';
import '../modules/all_pages/pages/emploree_pages/support_comman_page.dart';
import '../modules/all_pages/pages/login.dart';
import '../modules/all_pages/pages/profile.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  LoginController _loginController = Get.put(LoginController());
  final ProfileController _profileController = Get.find();
  AllSavedJobController _savedJobController = Get.put(AllSavedJobController());
  AllAppliedJobController _allappliedController =
      Get.put(AllAppliedJobController());
  HomePageController _homePageController = Get.find();
  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  SupportEmployeeController _supportEmployeeController =
      Get.put(SupportEmployeeController());

  final snackBarDuration = Duration(seconds: 3); // Define your desired duration

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[logoColor, logoColor]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: responsiveContainer(
                          // padding: const EdgeInsets.only(right: 0),
                          //height: 20,
                          //width: 20,
                          heightPortrait:
                              MediaQuery.of(context).size.height * 0.12,
                          widthPortrait:
                              MediaQuery.of(context).size.width * 0.25,
                          heightLandscape:
                              MediaQuery.of(context).size.height * 0.3,
                          widthLandscape:
                              MediaQuery.of(context).size.width * 0.2,
                          // height: MediaQuery.of(context).size.height *
                          //     0.05, // 20% of screen height if not provided
                          // width: MediaQuery.of(context).size.width * 0.09,
                          child: _profileController.getprofileModel?.response!
                                      .profileImage !=
                                  null
                              ? Image.network(
                                  "${_profileController.getprofileModel?.response!.profileImage.toString()}",
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
                    Text(
                      "${_profileController.getprofileModel?.response?.fullName.toString()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${_profileController.getprofileModel?.response?.emailId.toString()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // UserAccountsDrawerHeader(
            //   accountName: const Text(
            //     'Kumar Prince',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   accountEmail: const Text(
            //     'prince@prince.com',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   currentAccountPicture: CircleAvatar(
            //     child: ClipOval(
            //       child: Image.asset(
            //         'lib/assets/images/s3.jpg',
            //         fit: BoxFit.cover,
            //         width: 90,
            //         height: 90,
            //       ),
            //     ),
            //   ),
            // ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Profile'),
              onTap: () async {
                await _profileController.profileApi();
                _profileController.update();
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Saved Job'),
              onTap: () async {
                //navigator?.pop(context);

                await _savedJobController.savedjobListApi();
                _savedJobController.onInit();

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bookmark()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.done_all),
              title: const Text('Applied Jobs'),
              onTap: () async {
                await _allappliedController.appliedjobListApi();
                _allappliedController.onInit();
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppliedJobs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Companies'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Company()));
              },
            ),

            ///todo: inbox and chat features.....
            // ListTile(
            //   leading: const Icon(Icons.inbox),
            //   title: const Text('Inbox'),
            //   onTap: () {
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => const Inbox()));
            //   },
            // ),
            ///todo: end inbox and chat features.....

            ListTile(
              leading: const Icon(Icons.password),
              title: const Text('Change Password'),
              onTap: () async {
                //  _supportEmployeeController.supportemployeeApi();
                // _supportEmployeeController.update();
                // _registrationController.getStatepi();
                //_registrationController.onInit();
                // _registrationController.selectedState.value = null;
                // await Future.delayed(Duration(milliseconds: 800));

                await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()
                        //InviteFriend()
                        ));
              },
            ),

            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Contact Us'),
              onTap: () async {
                await _supportEmployeeController.supportemployeeApi();
                _supportEmployeeController.update();
                // _registrationController.getStatepi();
                //_registrationController.onInit();
                // _registrationController.selectedState.value = null;
                await Future.delayed(Duration(milliseconds: 800));

                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SupportViewHirejobComman()
                        //InviteFriend()
                        ));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.notifications),
            //   title: const Text('Notification'),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const NotificationScreen()));
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () async {
                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                _loginController.onInit();

                await Future.delayed(Duration(seconds: 1));

                await SharedPreferences.getInstance()
                    .then((prefs) => prefs.clear());

                // Hide loading dialog
                Get.back();

                // Navigate to login screen
                await Get.offAll(() => Login());

                // Show success snackbar
                Get.snackbar(
                  'Success',
                  'Successfully logged out',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  duration: snackBarDuration, // Set the duration
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
