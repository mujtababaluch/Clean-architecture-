import 'package:clean_arch/src/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injector.dart';
import 'src/config/get_pages.dart';

void main() async {
  
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: "CLeanArch",
      initialRoute: AppRoutes.splashscreen,
      getPages: Routes.getallpages(),
    );
  }
}