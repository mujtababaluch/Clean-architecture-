import 'package:clean_arch/src/config/app_routes.dart';
import 'package:clean_arch/src/presentation/home_screen/home_binding.dart';
import 'package:clean_arch/src/presentation/home_screen/home_screen.dart';
import 'package:clean_arch/src/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../presentation/splash_screen/spalsh_binding.dart';

class Routes {
  static List<GetPage> getallpages(){
    return [
      GetPage(
        name: AppRoutes.splashscreen, 
        binding: SpalshBinding(),
        page: () => const SplashScreen(),),
        GetPage(
          name: AppRoutes.homescreen,
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        )
    ];
  }
}