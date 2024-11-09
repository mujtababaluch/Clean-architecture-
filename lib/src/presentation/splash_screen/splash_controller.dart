import 'package:clean_arch/src/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin{

  AnimationController? animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController( duration: const Duration(seconds: 3,),vsync: this,)
    ..forward()
    ..addStatusListener(
      (status) {
        if(status == AnimationStatus.completed){
          Get.offNamed(AppRoutes.homescreen);
  }
      },
    );
  }
}