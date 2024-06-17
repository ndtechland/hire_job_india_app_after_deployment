import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
