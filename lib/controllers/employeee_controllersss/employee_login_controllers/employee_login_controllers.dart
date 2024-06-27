import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/employee_model/autologin_employee_model.dart';
import '../../../modules/all_pages/pages/emploree_pages/home_page_employee.dart';
import '../../../modules/payments_pages/payment_get_page.dart';
import '../../../services_apis/api_servicesss.dart';
import '../../../services_apis/auto_login_employee.dart';
import '../../employee_controller/profile_controller/profile_info_employee_controller.dart';
import '../employee_dashboard_controller/employee_dashboardcontroller.dart';
import '../payment_get_controller/payment_get_controller.dart';

class EmployeeLoginController extends GetxController {
//   final EmployeeProfileController _employeeprofileController =
//       Get.put(EmployeeProfileController());

  final ProfileEmployeeController _getprofileepersonal =
      Get.put(ProfileEmployeeController());
  HomedashboardController _homedashboardController =
      Get.put(HomedashboardController());
  final PaymentEmployeeController _employeeController =
      Get.put(PaymentEmployeeController());

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
        final accountData = employeeLoginFromJson(response.body);

        if (accountData.loginemp?.status == "200") {
          // Fetch profile and dashboard data if login is successful
          _getprofileepersonal.profileemployeeApi();
          _getprofileepersonal.update();

          await accountService2.setAccountData2(accountData);
          await _homedashboardController.dashboarddApi();

          // Navigate based on isPayment status
          if (accountData.loginemp?.isPayment == true) {
            Get.off(() => HomeEmployee());
          } else {
            await _employeeController.paymentemployeeApi();
            _employeeController.onInit();
            Get.off(() => GetPaymentPage());
          }
        } else {
          Get.snackbar('Error', 'Failed to login. Status is false.');
        }
      } else {
        Get.snackbar('Error', 'Failed to login. Please try again.');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }

    //   if (response.statusCode == 200) {
    //     final accountData2 = employeeLoginFromJson(response.body);
    //
    //     if (accountData2.loginemp?.status == "true") {
    //       // Fetch profile and dashboard data if login is successful
    //       _getprofileepersonal.profileemployeeApi();
    //       _getprofileepersonal.update();
    //
    //       final accountData2 = employeeLoginFromJson(response.body);
    //       await accountService2.setAccountData2(accountData2);
    //       await _homedashboardController.dashboarddApi();
    //
    //       // Navigate to HomeEmployee page
    //       Get.off(() => HomeEmployee());
    //     } else {
    //       await _employeeController.paymentemployeeApi();
    //       _employeeController.onInit();
    //       // await Navigator.push(context,
    //       //     MaterialPageRoute(builder: (context) => GetPaymentPage()));
    //       // Navigate to OtherPage if login is unsuccessful
    //       Get.off(() => GetPaymentPage());
    //       // Get.snackbar('Do Payment', 'Do Your payment.');
    //     }
    //   } else {
    //     Get.snackbar('Error', 'Failed to login. Please try again.');
    //   }
    // } catch (e) {
    //   print('Error during login: $e');
    //   // Get.off(() => HomeEmployee());
    //
    //   // Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    // } finally {
    //   isLoading.value = false;
    // }
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
