import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirejobindia/constants/themes/theme_colors.dart';
import 'package:hirejobindia/controllers/drower_home_controller/drower_home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainnDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavController _navcontroller = Get.put(NavController(), permanent: true);

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: Drawer(
        backgroundColor: AppColors.jobbackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('lib/assets/logo/hirelogo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.jobbluegray,
              ),
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.home,
                color: Colors.black,
                size: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.car_crash_rounded,
                color: Colors.black,
                size: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Job1',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();
                //await Get.to(GoogleSearchPlacesApi());

                //Get.to(SearchLocationScreen());
                _navcontroller.tabindex(1);

                ///
                //await Get.to(GoogleSearchPlacesApi());

                ///SearchLocationScreen

                // Get.to(() => BookingAmb());
                //Get.to(() => AllProducts());
                //Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.person,
                color: Colors.black,
                size: 14,
              ),

              ///........................................
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  // Get.currentRoute == '/NavBar'
                  //     ? Colors.grey[300]
                  //     :
                  Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                //Get.back();

                ///......................................
                // _navController.tabindex(3);
                /// Get.to(() => NavBar());
                //Get.to(() => BestDeal());
                // Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.edit,
                color: Colors.black,
                size: 16,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Update Profile',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/EditProfilePage'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                print(Get.currentRoute);
              },
            ),

            /// wallet
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.wallet,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Wallet',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/Wallet' ? Colors.grey[300] : null,
              onTap: () async {},
            ),

            ///
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.history_edu_outlined,
                color: Colors.black,
                size: 11,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'History',
                //'Our Story',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPaymentHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                Get.back();
                //await Get.to(() => UserPaymentHistory());
                //Get.offNamed('/OurStory');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Apply',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPayoutHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                Get.back();
              },
              //
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.web,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Website',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WhatsAppTrackOrder'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => WebViewPswebsite());
                // Get.offNamed('/WhatsAppTrackOrder');
              },
            ),

            ///ComplainPage
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.message,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Complain',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/ComplainPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                // Get.to(() => ComplainPage());
                Get.offNamed('/ComplainPage');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Support',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                // Get.to(() => SupportViewAmbrdComman());
                Get.offNamed('/PersonalProfile');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.business,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/UserAboutUsView'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                /// Get.to(() => UserAboutUsView());
                Get.offNamed('/UserAboutUsView');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.policy,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Privecy Policy',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///................................................................
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///...........................................................
                ///Get.to(() => privecy_policy());
                Get.offNamed('/PersonalProfile');
              },
            ),

            ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 11,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Delete Account',

                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                //fontWeight: FontWeight.w600,
                //color: Colors.black,
                // ),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: "Welcome To Ambrd",
                  middleText: "You content goes here...",
                  content: getContent(),
                  barrierDismissible: true,
                  radius: 20.0,
                  confirm: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: confirmBtn(),
                  ),
                  cancel: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: cancelBtn(),
                  ),
                );
              }, //PersonalDetails
            ),

            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.login,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/LoginPage' ? Colors.grey[300] : null,
              onTap: () async {
                print(Get.currentRoute);

                await Future.delayed(Duration(seconds: 2));

                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                //prefs.remove('email');

                //Get.to(() => LoginPage());
                /// Get.offNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Cancel"));
  }

  Widget getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "If Yow want to remove your account,",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Then you please click confirm button",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Your data will erase if you press confirm.",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "If you don't want to delete press cancel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ],
    );
  }
}
