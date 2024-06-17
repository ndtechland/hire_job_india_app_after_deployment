import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hirejobindia/services_apis/api_servicesss.dart';

import '../../../models/employee_model/support_comman_model.dart';

class SupportEmployeeController extends GetxController {
  RxBool isLoading = true.obs;

  RxString cvUrl = ''.obs;

  SupportModel? supportModel;

  //PriofileBankDetailEmployeeApi

  Future<void> supportemployeeApi() async {
    isLoading(true);
    supportModel = await ApiProvider.SupportUserEmployeeApi();

    if (supportModel?.response?.id == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(true);
      supportModel = await ApiProvider.SupportUserEmployeeApi();
    }
    if (supportModel?.response?.id != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    supportemployeeApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
