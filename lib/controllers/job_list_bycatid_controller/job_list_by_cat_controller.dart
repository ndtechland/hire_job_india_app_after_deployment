// import 'package:get/get.dart';
// import 'package:hirejobindia/models/saved_job_model.dart';
//
// import '../../models/all_jobs_model.dart';
// import '../../models/job_list_bycat_id_model.dart';
// import '../../services_apis/api_servicesss.dart'; // Import your ApiProvider
//
// class AllJobbycatidController extends GetxController {
//   RxBool isLoading = true.obs;
//   //List<AllJobsApiModel> allJobs = [];
//
//   AllJobsbyCatIdModel? allJobsbyCatIdModel;
//
//   final ApiProvider _apiProvider = ApiProvider(); // Use ApiProvider instance
//   String searchQuery = "";
//
//   Future<void> jobListByCatIDApi() async {
//     isLoading(true);
//     savejobapimodel = await ApiProvider.AllJobsbycatIDApi();
//     print('Prince doctor list');
//     print(savejobapimodel);
//     if (savejobapimodel != null) {
//       //Get.to(() => TotalPrice());
//       isLoading(false);
//       foundSavedJobs.value = savejobapimodel!.response!;
//       //Get.to(()=>Container());
//     }
//   }
//
//   ///todo: delete job api....
//   void deleteJob(int jobId) async {
//     isLoading(true);
//     bool success = await ApiProvider.deleteJobApi(jobId);
//     isLoading(false);
//
//     if (success) {
//       foundSavedJobs.removeWhere((job) => job.id == jobId);
//       Get.snackbar('Success', 'Job deleted successfully');
//     } else {
//       Get.snackbar('Error', 'Failed to delete job');
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     savedjobListApi();
//   }
//
//   RxList<JobResponseSaved> foundSavedJobs = RxList<JobResponseSaved>([]);
//   void filterSavedJob(String searchsavejobName) {
//     List<JobResponseSaved>? finalResult = [];
//     if (searchsavejobName.isEmpty) {
//       finalResult = savejobapimodel!.response;
//     } else {
//       finalResult = savejobapimodel!.response!
//           .where((element) => element.jobTitle
//           .toString()
//           .toLowerCase()
//           .contains(searchsavejobName.toString().toLowerCase().trim()))
//           .toList();
//     }
//     print(finalResult?.length);
//     foundSavedJobs.value = finalResult!;
//   }
//
//   void applyForJob(AllJobsApiModel job) {
//     // Implement apply for job functionality
//   }
// }
