import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/city_model.dart';
import '../../../models/state_model.dart';
import '../../../modules/all_pages/pages/emploree_pages/leaves_employee/multiple_day.dart';
import '../../../services_apis/api_servicesss.dart';

class EmployeeUpdatePersonalController extends GetxController {
  final isLoading = false.obs;

  final GlobalKey<FormState> personalinfoFormKey = GlobalKey<FormState>();

  Rx<Gender> selectedGender = Gender.male.obs; // Use enum type

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

  Future<void> updateProfilePersonalApi({
    required String personalEmailAddress,
    required String mobileNumber,
    required String dateOfBirth,
    required String age,
    required String fatherName,
    required String pAN,
    required String addressLine1,
    required String addressLine2,
    required String cityid,
    required String stateid,
    required String pincode,
    required String aadharNo,
    required List<Uint8List> aadharFileContent,
    required String Aadharbase64,
    required Uint8List panFileContent,
    required String Panbase64,
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'PersonalEmailAddress': personalEmailAddress,
        'MobileNumber': mobileNumber,
        'DateOfBirth': dateOfBirth,
        'Age': age,
        'FatherName': fatherName,
        'PAN': pAN,
        'AddressLine1': addressLine1,
        'AddressLine2': addressLine2,
        'cityid': cityid,
        'Stateid': stateid,
        'Pincode': pincode,
        'AadharNo': aadharNo,
      };

      final response = await ApiProvider.updatePersonal(
        formData,
        aadharFileContent,
        Aadharbase64,
        panFileContent,
        Panbase64,
      );

      if (response.statusCode == 200) {
        print('Update Profile successfully!');
        print(response.body);
      } else {
        print('Error Updation profile: ${response.statusCode}');
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
  }
}
