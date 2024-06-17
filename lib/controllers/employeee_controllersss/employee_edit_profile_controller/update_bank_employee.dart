import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services_apis/api_servicesss.dart';

class BankEmployeeUodateController extends GetxController {
  final isLoading = false.obs;

  var selectedGender = ''.obs;

  final GlobalKey<FormState> bankemployeeFormKey = GlobalKey<FormState>();

  //final selectedGender = Gender.male.obs; // Add observable for selected gender

  onChangeShifts(String servicee) {
    selectedGender.value = servicee;
  }

  Future<void> updateBankProfile({
    required String accountHolderName,
    required String bankname,
    required String accountNumber,
    required String reEnterAccountNumber,
    required String ifsc,
    required String accountTypeId,
    required String epfNumber,
    String? deductionCycle,
    String? employeeContributionRate,
    required String nominee,
    required Uint8List cvFileContent,
    required String Chequebase64, // Add this parameter
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'AccountHolderName': accountHolderName,
        'BankName': bankname,
        'AccountNumber': accountNumber,
        'ReEnterAccountNumber': reEnterAccountNumber,
        'Ifsc': ifsc,
        'AccountTypeId': accountTypeId,
        'EpfNumber': epfNumber,
        'Nominee': nominee,
      };

      if (deductionCycle != null) {
        formData['DeductionCycle'] = deductionCycle;
      }

      if (employeeContributionRate != null) {
        formData['employeeContributionRate'] = employeeContributionRate;
      }

      // Make API call
      final response = await ApiProvider.updateBankEmployeeApi(
          formData, cvFileContent, Chequebase64);

      print(response.body);

      if (response.statusCode == 200) {
        print('Bank Update successfully!');
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

    //getNurseTypeApi();
    // selectedState.listen((p0) {
    //   // if (p0 != null) {
    //   //   getCityByStateIDLab("${p0.id}");
    //   // }
    // });
  }
}
