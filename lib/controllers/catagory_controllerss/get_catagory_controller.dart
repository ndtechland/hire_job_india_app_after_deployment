import 'package:get/get.dart';

import '../../models/all_catagary.dart';
import '../../services_apis/api_servicesss.dart';

class AllcatagoryController extends GetxController {
  var isLoading = true.obs;
  PostedByModel? allcatApiModel;

  final ApiProvider _apiProvider = ApiProvider();
  String searchQuery = "";

  void catagoryListApi() async {
    isLoading(true);
    allcatApiModel = await ApiProvider.AllcatagoryApi();
    print('Prince doctor list');
    print(allcatApiModel);
    if (allcatApiModel!.getPostedbyList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundcategory.value = allcatApiModel!.getPostedbyList!;
      //Get.to(()=>Container());
    }
  }

  //RxList<GetAllCatList> foundcatagory = RxList<GetAllCatList>([]);

  @override
  void onInit() {
    super.onInit();
    catagoryListApi();
  }

  RxList<PostedByItem> foundcategory = RxList<PostedByItem>([]);
  void filterCatagorryy(String searchcatName) {
    List<PostedByItem>? finalResult = [];
    if (searchcatName.isEmpty) {
      finalResult = allcatApiModel!.getPostedbyList;
    } else {
      finalResult = allcatApiModel!.getPostedbyList!
          .where((element) => element.postedtype
              .toString()
              .toLowerCase()
              .contains(searchcatName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundcategory.value = finalResult!;
  }

  void applyForJobs(PostedByItem job) {
    // Implement apply for job functionality
  }
}
