import 'package:get/get.dart';

import '../../../models/employee_model/all_salary_slip_model.dart';
import '../../../services_apis/api_servicesss.dart';

class AllSalarySlipController extends GetxController {
  RxBool isLoading = true.obs;
  AllsalaryslipModells? allSalarySlipModel;
  final ApiProvider _apiProvider = ApiProvider(); // Use ApiProvider instance
  String searchQuery = "";

  RxList<ModelClassSalary> foundSalarySlips = RxList<ModelClassSalary>([]);

  @override
  void onInit() {
    super.onInit();
    fetchSalarySlips();
  }

  Future<void> fetchSalarySlips() async {
    isLoading(true);
    allSalarySlipModel = await ApiProvider.getSalarySlips();
    print('Fetched salary slips: $allSalarySlipModel');
    if (allSalarySlipModel != null) {
      foundSalarySlips.value = allSalarySlipModel!.data!;
    }
    isLoading(false);
  }

  void filterSalarySlips(String searchSalarySlipName) {
    List<ModelClassSalary>? finalResult = [];
    if (searchSalarySlipName.isEmpty) {
      finalResult = allSalarySlipModel!.data;
    } else {
      finalResult = allSalarySlipModel!.data!
          .where((element) => element.salarySlipName!
              .toLowerCase()
              .contains(searchSalarySlipName.toLowerCase().trim()))
          .toList();
    }
    foundSalarySlips.value = finalResult!;
    print('Filtered salary slips: ${foundSalarySlips.length}');
  }

  void viewForSlip(ModelClassSalary job) {
    // Implement view functionality for a salary slip
  }
}
