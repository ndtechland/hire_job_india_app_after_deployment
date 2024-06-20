import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hirejobindia/services_apis/api_servicesss.dart';

import '../../../models/employee_model/payment_get_model/get_payment_model.dart';

class PaymentEmployeeController extends GetxController {
  RxBool isLoading = true.obs;

  RxString cvUrl = ''.obs;

  GetPaymentModel? getPaymentModel;
  //BasicInformationModel? getbasicemployeeModel;

  // GetProfileEmployeePersonalModel? getprofileemployeeModel;

  //BankDetailInformationModel? getbankprofiledetail;

  //PriofileBankDetailEmployeeApi

  Future<void> paymentemployeeApi() async {
    isLoading(true);
    getPaymentModel = await ApiProvider.EmployeePaymentGetApi();

    if (getPaymentModel?.data == null) {
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
      getPaymentModel = await ApiProvider.EmployeePaymentGetApi();
    }
    if (getPaymentModel?.data != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  // Future<void> profileBasicemployeeApi() async {
  //   isLoading(true);
  //   getbasicemployeeModel = await ApiProvider.PriofileBasicEmployeeApi();
  //
  //   if (getbasicemployeeModel?.data?.employeeId == null) {
  //     Timer(
  //       const Duration(seconds: 1),
  //           () {
  //         //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
  //         //Get.to(() => MedicineCart());
  //         //Get.to((page))
  //         ///
  //       },
  //     );
  //     isLoading(true);
  //     getbasicemployeeModel = await ApiProvider.PriofileBasicEmployeeApi();
  //   }
  //   if (getbasicemployeeModel?.data?.employeeId != null) {
  //     //Get.to(() => TotalPrice());
  //     isLoading(false);
  //   }
  // }
  //
  // Future<void> profileEmployeBankApi() async {
  //   isLoading(true);
  //   getbankprofiledetail = await ApiProvider.PriofileBankDetailEmployeeApi();
  //
  //   if (getbankprofiledetail?.data?.accountHolderName == null) {
  //     Timer(
  //       const Duration(seconds: 1),
  //           () {
  //         //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
  //         //Get.to(() => MedicineCart());
  //         //Get.to((page))
  //         ///
  //       },
  //     );
  //     isLoading(true);
  //     getbankprofiledetail = await ApiProvider.PriofileBankDetailEmployeeApi();
  //   }
  //   if (getbankprofiledetail?.data?.accountHolderName != null) {
  //     //Get.to(() => TotalPrice());
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    paymentemployeeApi();
    //profileBasicemployeeApi();
    // profileEmployeBankApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
