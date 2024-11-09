import 'package:clean_arch/src/presentation/splash_screen/splash_controller.dart';
import 'package:get/get.dart';

class SpalshBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<SplashController>(
      () => SplashController(),
     );
  }

}