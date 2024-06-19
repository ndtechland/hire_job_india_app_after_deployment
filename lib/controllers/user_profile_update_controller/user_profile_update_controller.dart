import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../services_apis/api_servicesss.dart';
import '../../models/city_model.dart';
import '../../models/state_model.dart';
import '../../modules/all_pages/pages/home.dart';
import '../user_profile_controller/user_profile_controller.dart';

class UserProfileUodateController extends GetxController {
  final isLoading = false.obs;
  var selectedGender = ''.obs;
  static String userId = ''; // Consider if this should remain static
  final GlobalKey<FormState> userprifileFormKey = GlobalKey<FormState>();
  final ProfileController _getprofilee = Get.put(ProfileController());

  // GetStorage instance
  //final storage = GetStorage();
  //static late SharedPreferences prefs;

  // Initialize SharedPreferences

  @override
  void onInit() {
    super.onInit();
    getStatepi();
    // initSharedPreferences(); // Initialize shared preferences

    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
  }

  // Future<void> initSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  onChangeShifts(String servicee) {
    selectedGender.value = servicee;
  }

  Rx<CityModell?> selectedCity = (null as CityModell?).obs;
  RxList<CityModell> cities = <CityModell>[].obs;

  Rx<StateModelss?> selectedState = (null as StateModelss?).obs;
  List<StateModelss> states = <StateModelss>[].obs;

  void getStatepi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  Future<void> updateUseerrProfile({
    String? fullName,
    String? emailID,
    String? mobileNumber,
    String? experience,
    String? stateId,
    String? cityId,
    String? dateofbirth,
    String? pincode,
    String? address,
    String? currentCTC,
    String? expectedCTC,
    required Uint8List cvFileContent,
    required String CVFileName,
    required Uint8List cvFileContent2,
    required String ProfileImage,
  }) async {
    try {
      isLoading(true);

      // Retrieve userId from GetStorage
      // final userId = storage.read('userId');
      // Retrieve userId from storage
      // final userId = _getprofilee.getprofileModel?.response?.id.toString();
      //prefs.getString('userId');
      //
      // if (userId == null || userId.isEmpty) {
      //   Fluttertoast.showToast(
      //     msg: 'User ID is not available. Please log in again.',
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.BOTTOM,
      //   );
      //   return;
      // } // Adjust key as per your implementation

      final Map<String, String> formData = {
        'userId':
            "${_getprofilee.getprofileModel?.response?.id?.toInt()}", // Use userId retrieved from storage
        'FullName': fullName ?? "",
        'EmailID': emailID ?? "",
        'MobileNumber': mobileNumber ?? "",
        'Experience': experience ?? "",
        'StateId': stateId ??
            "${_getprofilee.getprofileModel?.response?.stateid?.toString()}",
        'CityId': cityId ??
            "${_getprofilee.getprofileModel?.response?.cityid?.toString()}",
        'Dateofbirth': dateofbirth ?? "",
        'Pincode': pincode ?? "",
        'Address': address ?? "",
        'CurrentCTC': currentCTC ?? "",
        'ExpectedCTC': expectedCTC ?? "",
      };

      print('Form Data: $formData');

      final response = await ApiProvider.updateuserProfileApi(
        formData,
        cvFileContent,
        CVFileName,
        cvFileContent2,
        ProfileImage,
      );

      print(response.body);
      print('Form Data: $formData');

      if (response.statusCode == 200) {
        print('Profile Update successfully!');
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
          Get.off(Home()); // Navigate to Home screen
        });
        //Get.to(Home());
        // Handle navigation or feedback on successful update
      } else {
        print('Error Update Profile: ${response.statusCode}');
        Fluttertoast.showToast(
          msg: 'Failed to update profile. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
        // Handle error scenarios
      }
      // Handle error scenario

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
}
