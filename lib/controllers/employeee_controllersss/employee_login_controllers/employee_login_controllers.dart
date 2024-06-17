import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/employee_model/autologin_employee_model.dart';
import '../../../modules/all_pages/pages/emploree_pages/home_page_employee.dart';
import '../../../services_apis/api_servicesss.dart';
import '../../../services_apis/auto_login_employee.dart';
import '../../employee_controller/profile_controller/profile_info_employee_controller.dart';
import '../employee_dashboard_controller/employee_dashboardcontroller.dart';

class EmployeeLoginController extends GetxController {
//   final EmployeeProfileController _employeeprofileController =
//       Get.put(EmployeeProfileController());

  final ProfileEmployeeController _getprofileepersonal =
      Get.put(ProfileEmployeeController());
  HomedashboardController _homedashboardController =
      Get.put(HomedashboardController());

  final GlobalKey<FormState> loginFormKey2 = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> loginemployeeApi() async {
    try {
      isLoading.value = true;

      final response = await ApiProvider.EmployeeLoginApi(
        usernameController.text,
        passwordController.text,
      );

      if (response.statusCode == 200) {
        _getprofileepersonal.profileemployeeApi();
        _getprofileepersonal.update();

        final accountData2 = employeeLoginFromJson(response.body);
        await accountService2.setAccountData2(accountData2);
        await _homedashboardController.dashboarddApi();

        Get.off(() => HomeEmployee());
      } else {
        Get.snackbar('Error', 'Failed to login. Please try again.');
      }
    } catch (e) {
      print('Error during login: $e');
      // Get.off(() => HomeEmployee());

      // Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers, listeners, etc.
  }

  String? validateUser(String value) {
    if (value.isEmpty) {
      return 'Please provide a username';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
      return 'Please provide a valid password';
    }
    return null;
  }

  void checkemployeeLogin() {
    if (loginFormKey2.currentState!.validate()) {
      loginFormKey2.currentState!.save();
      loginemployeeApi();
    }
  }
}
