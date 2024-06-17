// ChangePasswordController.dart

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services_apis/api_servicesss.dart';
import '../user_profile_controller/user_profile_controller.dart';

class ChangePasswordController extends GetxController {
  final ProfileController _profileController = Get.put(ProfileController());

  final GlobalKey<FormState> changepasswordFormKey = GlobalKey<FormState>();

  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController passwordController3 = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> changepasswordApi(BuildContext context) async {
    try {
      isLoading.value = false;

      final response = await ApiProvider.ChangePasswordApi(
        context, // Pass the context
        passwordController1.text,
        passwordController2.text,
        passwordController3.text,
      );

      if (response?.statusCode == 200) {
        // Navigate to Home Page
        //Get.off(() => Home());
      } else {
        // Handle other status codes or errors
        // Get.snackbar('Error', 'Failed to change password. Please try again.');
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      //Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
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

  void checkPasswordchange(BuildContext context) {
    if (changepasswordFormKey.currentState!.validate()) {
      changepasswordFormKey.currentState!.save();
      changepasswordApi(context); // Pass the context
    }
  }
}
