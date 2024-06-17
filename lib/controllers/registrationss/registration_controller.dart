import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/modules/all_pages/pages/login.dart';

import '../../models/city_model.dart';
import '../../models/state_model.dart';
import '../../services_apis/api_servicesss.dart';

class RegistrationController extends GetxController {
  final isLoading = false.obs;

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  var selectedGender = ''.obs;

  Rx<CityModell?> selectedCity = (null as CityModell?).obs;
  RxList<CityModell> cities = <CityModell>[].obs;

  Rx<StateModelss?> selectedState = (null as StateModelss?).obs;
  List<StateModelss> states = <StateModelss>[].obs;

  //final selectedGender = Gender.male.obs; // Add observable for selected gender

  onChangeShifts(String servicee) {
    selectedGender.value = servicee;
  }

  void getStatepi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  Future<void> createProfile({
    required String fullName,
    required String emailID,
    required String password,
    required String mobileNumber,
    required String experience,
    required String stateId,
    required String cityId,
    required String genderName,
    required String dateOfBirth,
    required String address,
    required String pincode,
    required Uint8List cvFileContent,
    required String cvFileName, // Add this parameter
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'FullName': fullName,
        'EmailID': emailID,
        'Password': password,
        'MobileNumber': mobileNumber,
        'Experience': experience,
        'StateId': stateId,
        'CityId': cityId,
        'GenderName': genderName,
        'Dateofbirth': dateOfBirth,
        'Address': address,
        'Pincode': pincode,
      };

      // Make API call
      final response =
          await ApiProvider.createProfile(formData, cvFileContent, cvFileName);

      if (response.statusCode == 200) {
        print('Profile created successfully!');
        // Get.offAll(Login());
        Get.offAll(() => Login());
        print(response.body);
      } else {
        print('Error creating profile: ${response.statusCode}');
      }
    } catch (error) {
      print('Network error: $error');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStatepi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    //getNurseTypeApi();
    // selectedState.listen((p0) {
    //   // if (p0 != null) {
    //   //   getCityByStateIDLab("${p0.id}");
    //   // }
    // });
  }
}
