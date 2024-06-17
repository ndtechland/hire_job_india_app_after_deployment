import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/controllers/employee_controller/profile_controller/profile_info_employee_controller.dart';
import 'package:hirejobindia/controllers/employeee_controllersss/employee_dashboard_controller/employee_dashboardcontroller.dart';
import 'package:hirejobindia/controllers/splash_controller/splash_controllers.dart';
import 'package:hirejobindia/controllers/user_profile_controller/user_profile_controller.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/home_page_employee.dart';
import 'package:hirejobindia/modules/all_pages/pages/home.dart';
import 'package:hirejobindia/modules/all_pages/pages/slider.dart';

import '../../services_apis/auto_login_employee.dart';
import '../../services_apis/autologin_services.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final ProfileController _profileController = Get.put(ProfileController());
  final ProfileEmployeeController _getprofileepersonal =
      Get.put(ProfileEmployeeController());
  final HomedashboardController _homedashboardController =
      Get.put(HomedashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenControllers>(
        init: SplashScreenControllers(),
        builder: (controller) {
          if (controller.animation.status == AnimationStatus.completed) {
            // Start the timer
            Timer(Duration(seconds: 2), () async {
              try {
                final accountData = await accountService.getAccountData;
                final accountData2 = await accountService2.getAccountData2;
                print("AccountData: $accountData");
                print("AccountData2: $accountData2");

                if (accountData != null && accountData2 != null) {
                  await _getprofileepersonal.profileemployeeApi();
                  await _homedashboardController.dashboarddApi();
                  _homedashboardController.update();
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeEmployee()),
                  );
                } else if (accountData2 != null) {
                  await _getprofileepersonal.profileemployeeApi();
                  await _homedashboardController.dashboarddApi();
                  _homedashboardController.update();
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeEmployee()),
                  );
                } else if (accountData != null) {
                  await _profileController.profileApi();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } else {
                  await _profileController.profileApi();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SliderScreen()),
                  );
                }
              } catch (error) {
                print('Error in SplashScreen: $error');
                // Handle error accordingly
              }
            });
          }

          return Center(
            child: AnimatedBuilder(
              animation: controller.animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: controller.animation.value * 2,
                  child: Image.asset(
                    'lib/assets/logo/hirelogo.png',
                    width: 150,
                    height: 200,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
