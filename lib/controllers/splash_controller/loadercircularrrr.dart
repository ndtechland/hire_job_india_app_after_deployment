import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }
}

final LoadingController loadingController = Get.put(LoadingController());
