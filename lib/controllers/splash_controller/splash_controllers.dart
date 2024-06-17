import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenControllers extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitialization();
    super.onInit();
  }

  void animationInitialization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() {
      update();
    });
    animationController.forward();
  }
}
