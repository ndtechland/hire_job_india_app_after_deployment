import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services_apis/api_servicesss.dart';
import '../../models/city_model.dart';
import '../../models/state_model.dart';

class UserProfileUodateController extends GetxController {
  final isLoading = false.obs;

  var selectedGender = ''.obs;

  static String userId = ''.toString();

  final GlobalKey<FormState> userprifileFormKey = GlobalKey<FormState>();

  //final selectedGender = Gender.male.obs; // Add observable for selected gender

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
    //String? userId,
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

    // Add this parameter
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'userId': "2",
        'FullName': "$fullName",
        'EmailID': "$emailID",
        'MobileNumber': "$mobileNumber",
        'Experience': "$experience",
        'StateId': "$stateId",
        'CityId': "$cityId",
        'Dateofbirth': "$dateofbirth",
        'Pincode': "$pincode",
        'Address': "$address",
        'CurrentCTC': "$currentCTC",
        'ExpectedCTC': "$expectedCTC",
        //CurrentCTC
        //ExpectedCTC
      };

      // Make API call
      final response = await ApiProvider.updateuserProfileApi(
          formData, cvFileContent, CVFileName, cvFileContent2, ProfileImage!);

      print(response.body);

      if (response.statusCode == 200) {
        print('Profile Update successfully!');
        // Get.offAll(Login());
        //Get.offAll(() => Login());
        print(response.body);
      } else {
        print('Error Update Profile: ${response.statusCode}');
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
