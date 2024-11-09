import 'package:clean_arch/src/presentation/home_screen/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding  extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}