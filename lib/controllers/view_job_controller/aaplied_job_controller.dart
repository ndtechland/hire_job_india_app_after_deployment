import 'package:get/get.dart';

import '../../models/all_jobs_model.dart';
import '../../models/applied_job_model.dart';
import '../../services_apis/api_servicesss.dart'; // Import your ApiProvider

class AllAppliedJobController extends GetxController {
  RxBool isLoading = true.obs;
  //List<AllJobsApiModel> allJobs = [];

  AllJobsAppliedApiModel? appliedjobapimodel;

  final ApiProvider _apiProvider = ApiProvider(); // Use ApiProvider instance
  String searchQuery = "";

  Future<void> appliedjobListApi() async {
    isLoading(true);
    appliedjobapimodel = await ApiProvider.AllAppliedJobsApi();
    print('Prince doctor list');
    print(appliedjobapimodel);
    if (appliedjobapimodel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundappliedJobs.value = appliedjobapimodel!.response!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    appliedjobListApi();
  }

  RxList<JobResponseApplied> foundappliedJobs = RxList<JobResponseApplied>([]);
  void filterAppliedJob(String searchaapliedjobName) {
    List<JobResponseApplied>? finalResult = [];
    if (searchaapliedjobName.isEmpty) {
      finalResult = appliedjobapimodel!.response;
    } else {
      finalResult = appliedjobapimodel!.response!
          .where((element) => element.jobTitle
              .toString()
              .toLowerCase()
              .contains(searchaapliedjobName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundappliedJobs.value = finalResult!;
  }

  void applyForJob(AllJobsApiModel job) {
    // Implement apply for job functionality
  }
}
