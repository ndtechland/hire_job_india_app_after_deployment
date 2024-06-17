import 'package:get/get.dart';

import '../../models/testimonial_model.dart';
import '../../services_apis/api_servicesss.dart';

class AlltestimonialController extends GetxController {
  var isLoading = true.obs;
  AllTestimonialModel? alltestimonialApiModel;
  final ApiProvider _apiProvider = ApiProvider(); // Use ApiProvider instance
  String searchQuery = "";

  void TestimonialApi() async {
    isLoading(true);
    alltestimonialApiModel = await ApiProvider.AllTestimonialApi();
    print('Prince testimonial list');
    print(alltestimonialApiModel);
    if (alltestimonialApiModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundtestmonial.value = alltestimonialApiModel!.response!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    TestimonialApi();
  }

  RxList<Responsetestimoniall> foundtestmonial =
      RxList<Responsetestimoniall>([]);
  void filterTestimonial(String searctestiName) {
    List<Responsetestimoniall>? finalResult = [];
    if (searctestiName.isEmpty) {
      finalResult = alltestimonialApiModel!.response;
    } else {
      finalResult = alltestimonialApiModel!.response!
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(searctestiName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundtestmonial.value = finalResult!;
  }

  void applyForJob(Responsetestimoniall job) {
    // Implement apply for job functionality
  }
}
