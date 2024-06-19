import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/home_page_employee.dart';

import '../../../services_apis/api_servicesss.dart';

class ProfilePictureEmployeController extends GetxController {
  final isLoading = false.obs;

  var selectedGender = ''.obs;

  final GlobalKey<FormState> profileimgemployeeFormKey = GlobalKey<FormState>();

  //final selectedGender = Gender.male.obs; // Add observable for selected gender

  onChangeShifts(String servicee) {
    selectedGender.value = servicee;
  }

  Future<void> updaprofilrimgProfile({
    required Uint8List cvFileContent3,
    required String Empprofile, // Add this parameter
  }) async {
    try {
      isLoading(true);

      // Make API call
      final response = await ApiProvider.updateProfileEmployeeApi(
          cvFileContent3, Empprofile);

      print(response.body);

      if (response.statusCode == 200) {
        print('profile Update successfully!');

        Fluttertoast.showToast(
          msg: 'Profile updated successfully!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 0, // Show toast for 1 second
        );
        // Show loading dialog before navigating
        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );

        // Navigate to Home screen after a short delay (simulating asynchronous operation)
        Future.delayed(Duration(seconds: 1), () {
          Get.back(); // Close the loading dialog
          Get.off(HomeEmployee()); // Navigate to Home screen
        });
        // Get.offAll(Login());
        //Get.offAll(() => Login());
        print(response.body);
      } else {
        print('Error Update Profile: ${response.statusCode}');
        Fluttertoast.showToast(
          msg: 'Failed to update bank. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      print('Network error: $error');
      Fluttertoast.showToast(
        msg: 'Network error. Please try again.',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();

    //getNurseTypeApi();
    // selectedState.listen((p0) {
    //   // if (p0 != null) {
    //   //   getCityByStateIDLab("${p0.id}");
    //   // }
    // });
  }
}
