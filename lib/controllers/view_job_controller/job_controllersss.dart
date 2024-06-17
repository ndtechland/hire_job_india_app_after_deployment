import 'package:get/get.dart';
import 'package:hirejobindia/models/all_jobs_model.dart';
import 'package:hirejobindia/models/saved_job_model.dart';
import 'package:hirejobindia/services_apis/api_servicesss.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/job_list_bycat_id_model.dart';

class AllJibsController extends GetxController {
  RxBool isLoading = true.obs;
  AllJobsApiModel? allJobsApiModel;
  AllJobsSavedApiModel? savejobapimodel;
  AllJobsbyCatIdModel? allJobsbyCatIdModel;

  final ApiProvider _apiProvider = ApiProvider();
  SharedPreferences? prefs;

  RxList<JobResponse> foundJobs = RxList<JobResponse>([]);
  RxList<JobResponseSaved> foundSavedJobs = RxList<JobResponseSaved>([]);

  RxList<AllJobCatID> foundJobsbycatId = RxList<AllJobCatID>([]);

  @override
  void onInit() {
    super.onInit();
    initSharedPreferences();
    jobListApi();
    savedjobListApi();
    jobListByCatIDApi();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void jobListApi() async {
    isLoading(true);
    try {
      allJobsApiModel = await ApiProvider.AllJobsApi();
      if (allJobsApiModel != null) {
        foundJobs.value = allJobsApiModel!.response ?? [];
      }
    } finally {
      isLoading(false);
    }
  }

  void savedjobListApi() async {
    isLoading(true);
    try {
      savejobapimodel = await ApiProvider.AllSavedJobsApi();
      if (savejobapimodel != null) {
        foundSavedJobs.value = savejobapimodel!.response ?? [];
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> jobListByCatIDApi([int? id]) async {
    isLoading(true);
    try {
      allJobsbyCatIdModel = await ApiProvider.AllJobsbycatIDApi(id);
      if (allJobsbyCatIdModel != null) {
        foundJobsbycatId.value = allJobsbyCatIdModel!.response ?? [];
      }
    } finally {
      isLoading(false);
    }
  }

  void filterDoctor(String searchName) {
    List<JobResponse>? finalResult = [];
    if (searchName.isEmpty) {
      finalResult = allJobsApiModel?.response;
    } else {
      finalResult = allJobsApiModel?.response
          ?.where((element) => element.jobTitle
              .toString()
              .toLowerCase()
              .contains(searchName.toLowerCase().trim()))
          ?.toList();
    }
    foundJobs.value = finalResult ?? [];
  }

  void filterSavedJob(String searchName) {
    List<JobResponseSaved>? finalResult = [];
    if (searchName.isEmpty) {
      finalResult = savejobapimodel?.response;
    } else {
      finalResult = savejobapimodel?.response
          ?.where((element) => element.jobTitle
              .toString()
              .toLowerCase()
              .contains(searchName.toLowerCase().trim()))
          ?.toList();
    }
    foundSavedJobs.value = finalResult ?? [];
  }

  void filterjobrelatedJob(String searchName) {
    List<AllJobCatID>? finalResult = [];
    if (searchName.isEmpty) {
      finalResult = allJobsbyCatIdModel?.response;
    } else {
      finalResult = allJobsbyCatIdModel?.response
          ?.where((element) => element.jobTitle
              .toString()
              .toLowerCase()
              .contains(searchName.toLowerCase().trim()))
          ?.toList();
    }
    foundJobsbycatId.value = finalResult ?? [];
  }

  // Future<void> saveJobListId(String jobListId) async {
  //   if (prefs != null) {
  //     await prefs!.setString('JobListId1', jobListId);
  //   } else {
  //     throw Exception('SharedPreferences instance not initialized.');
  //   }
  // }

  void applyForJob(JobResponse job) {
    // Implement apply for job functionality
  }
}
