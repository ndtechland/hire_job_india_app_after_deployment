import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/autologin_account_model.dart';
import '../../modules/all_pages/pages/home.dart';
import '../../services_apis/api_servicesss.dart';
import '../../services_apis/autologin_services.dart';
import '../user_profile_controller/user_profile_controller.dart';

class LoginController extends GetxController {
  final ProfileController _profileController = Get.put(ProfileController());

  //final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> loginApi() async {
    try {
      isLoading.value = true;

      final response = await ApiProvider.LoginApi(
        usernameController1.text,
        passwordController1.text,
      );

      if (response.statusCode == 200) {
        _profileController.profileApi();
        _profileController.update();

        final accountData = messageFromJson(response.body);
        await accountService.setAccountData(accountData);

        Get.off(() => Home());
      } else {
        Get.snackbar('Error', 'Failed to login. Please try again.');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
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

  void checkLogin() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      loginApi();
    }
  }
}
