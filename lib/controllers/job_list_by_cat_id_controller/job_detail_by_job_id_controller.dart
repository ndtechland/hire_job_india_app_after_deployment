import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/job_description_by_job_id.dart';
import '../../models/related_job_byjobId.dart';
import '../../services_apis/api_servicesss.dart';

class JobdetauilsbyJobIdController extends GetxController {
  RxBool isLoading = true.obs;

  //AllJibsController _allJibsController = Get.put(AllJibsController());

  RxString cvUrl = ''.obs;

  RelatedJobByJobIdModel? relatedjobapi;

  JobdetailbyjobIdModel? getjobdetailbyidModel;

  Future<void> jobdetailbyjobIdApi({String? jobListId}) async {
    isLoading(true);
    getjobdetailbyidModel = await ApiProvider.JobdetailByjobIdApi(jobListId);

    if (getjobdetailbyidModel?.response?.id == null) {
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
      getjobdetailbyidModel = await ApiProvider.JobdetailByjobIdApi(jobListId);
    }
    if (getjobdetailbyidModel?.response?.id != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  ///related job..
  String searchQuery = "";

  Future<void> relatedjobListApi({String? jobTitleid}) async {
    isLoading(true);
    relatedjobapi = await ApiProvider.RelatedJobsbyJobIdApi(jobTitleid);
    print('Prince doctor list');
    print(relatedjobapi);
    if (relatedjobapi != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundSavedJobs.value = relatedjobapi!.response!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    jobdetailbyjobIdApi();
    relatedjobListApi();
  }

  RxList<ResponseJobRelated> foundSavedJobs = RxList<ResponseJobRelated>([]);
  void filterSavedJob(String searchsavejobName) {
    List<ResponseJobRelated>? finalResult = [];
    if (searchsavejobName.isEmpty) {
      finalResult = relatedjobapi!.response;
    } else {
      finalResult = relatedjobapi!.response!
          .where((element) => element.jobTitle
              .toString()
              .toLowerCase()
              .contains(searchsavejobName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundSavedJobs.value = finalResult!;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
