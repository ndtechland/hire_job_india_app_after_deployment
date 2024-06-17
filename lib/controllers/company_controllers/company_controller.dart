import 'package:get/get.dart';

import '../../models/all_catagary.dart';
import '../../models/company_model.dart';
import '../../services_apis/api_servicesss.dart';

class AllcompanyController extends GetxController {
  var isLoading = true.obs;
  CompanyResponse? allcpmpanyApiModel;

  final ApiProvider _apiProvider = ApiProvider();
  String searchQuery = "";

  Future<void> companyListApi() async {
    isLoading(true);
    allcpmpanyApiModel = await ApiProvider.AllcompanyApi();
    print('Prince doctor list');
    print(allcpmpanyApiModel);
    if (allcpmpanyApiModel!.response != null) {
      //Get.to(() => TotalPrice());

      //await Get.to(CompanyDetail());
      isLoading(false);
      foundcompany.value = allcpmpanyApiModel!.response!;
      //Get.to(()=>Container());
    }
  }

  //RxList<GetAllCatList> foundcatagory = RxList<GetAllCatList>([]);

  @override
  void onInit() {
    super.onInit();
    companyListApi();
  }

  RxList<Company> foundcompany = RxList<Company>([]);
  void filterCaompany(String searchcatName) {
    List<Company>? finalResult = [];
    if (searchcatName.isEmpty) {
      finalResult = allcpmpanyApiModel!.response;
    } else {
      finalResult = allcpmpanyApiModel!.response!
          .where((element) => element.organizationName
              .toString()
              .toLowerCase()
              .contains(searchcatName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundcompany.value = finalResult!;
  }

  void applyForJobs(PostedByItem job) {
    // Implement apply for job functionality
  }
}
