import 'dart:async';

import 'package:get/get.dart';

import '../../../models/employee_model/dashboard_employee_model.dart';
import '../../../services_apis/api_servicesss.dart';

class HomedashboardController extends GetxController {
  RxBool isLoading = true.obs;
  // Rx<DashbordModel?> dashboardResponse = Rx<DashbordModel?>;
  DashbordModel? dashboardResponse;

  Future<void> dashboarddApi() async {
    isLoading(true);
    dashboardResponse = await ApiProvider.getDashboardApi();

    if (dashboardResponse?.data?.completionPercentage == null) {
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
      dashboardResponse = await ApiProvider.getDashboardApi();
    }
    if (dashboardResponse?.data?.completionPercentage != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    dashboarddApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
