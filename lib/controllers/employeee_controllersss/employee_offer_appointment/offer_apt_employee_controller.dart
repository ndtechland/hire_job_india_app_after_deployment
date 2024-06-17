import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hirejobindia/services_apis/api_servicesss.dart';

import '../../../models/employee_model/offer_appointment_latter_model.dart';

class AptOfferEmployeeController extends GetxController {
  RxBool isLoading = true.obs;

  RxString cvUrl = ''.obs;

  GetOfferAppointmentModel? getampofferModel;

  //PriofileBankDetailEmployeeApi

  Future<void> ampofferemployeeApi() async {
    isLoading(true);
    getampofferModel = await ApiProvider.OfferAppointmentEmployeeApi();

    if (getampofferModel?.data?.offerletter == null) {
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
      getampofferModel = await ApiProvider.OfferAppointmentEmployeeApi();
    }
    if (getampofferModel?.data?.offerletter != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    ampofferemployeeApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
