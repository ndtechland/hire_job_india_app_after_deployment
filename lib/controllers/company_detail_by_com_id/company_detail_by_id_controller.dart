import 'package:get/get.dart';

import '../../models/company_details_comId_model.dart';
import '../../services_apis/api_servicesss.dart'; // Import your ApiProvider

class CompanyDetailController extends GetxController {
  RxBool isLoading = true.obs;
  //List<AllJobsApiModel> allJobs = [];

  CompanyDetailByCompanyIdModel? companydetailbyIdmodel;

  final ApiProvider _apiProvider = ApiProvider(); // Use ApiProvider instance
//  String searchQuery = "";

  Future<void> companydetailbyIdApi([int? id]) async {
    isLoading(true);
    companydetailbyIdmodel = await ApiProvider.CompanyDetailByIdApi(id);
    print('Prince company list');
    print(companydetailbyIdmodel);
    if (companydetailbyIdmodel?.response?.id != null) {
      //Get.to(() => TotalPrice());
      // await Get.to(CompanyDetail());
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //         CompanyDetail(),
      //   ),
      // );
      isLoading(false);
      //foundSavedJobs.value = savejobapimodel!.response!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    companydetailbyIdApi();
  }
}
