import 'package:get/get.dart';
import 'package:hirejobindia/controllers/view_job_controller/job_controllersss.dart';
import 'package:http/http.dart' as http;

import '../../models/all_catagary.dart';
import '../../models/all_jobs_model.dart';
import '../../services_apis/api_servicesss.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  AllJibsController _allJibsController = Get.put(AllJibsController());

  PostedByModel? allcatApiModel;
  AllJobsApiModel? allJobsApiModel;

  String searchQuery = "";

  ///todo: all catagary...
  void catagoryListApi2() async {
    isLoading(true);
    allcatApiModel = await ApiProvider.AllcatagoryApi();
    print('Prince doctor list');
    print(allcatApiModel);
    if (allcatApiModel!.getPostedbyList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  void jobListApi2() async {
    isLoading(true);
    allJobsApiModel = await ApiProvider.AllJobsApi();
    print('Prince doctor list');
    print(allJobsApiModel);
    if (allJobsApiModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///todo: apply job..
  void applyjobssApi(String JobId) async {
    isLoading(false);
    http.Response r = await ApiProvider.ApplyJobAPi(JobId);
    if (r.statusCode == 200) {
      isLoading(false);

      ///Get.to(()=>page());
    }
  }

  ///todo: apply job successfully...........
  Future<void> savejobssApi(String JobId) async {
    isLoading(false);
    http.Response r = await ApiProvider.SaveJobAPi(JobId);
    if (r.statusCode == 200) {
      isLoading(false);

      ///Get.to(()=>page());
    }
  }
  //ApplyJobAPi

  //RxList<GetAllCatList> foundcatagory = RxList<GetAllCatList>([]);

  @override
  void onInit() {
    super.onInit();
    catagoryListApi2();
    jobListApi2();
  }
}
