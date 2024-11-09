import 'package:clean_arch/src/presentation/home_screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/state_enums.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController> (
      builder: (_) {
          if(controller.viewstate.value == ViewState.busy){
             return const Center(child: CircularProgressIndicator());
          }
           if (controller.viewstate.value == ViewState.error) {
            return const Center(child: Text("Error loading data")); 
          }
           if (controller.usedata.isEmpty) {
            return const Center(child: Text("No data available"));
          }
          return ListView.builder(
            itemCount:  controller.usedata.length,
            itemBuilder: (context, index) {
              final user = controller.usedata[index];
              return ListTile(
                title: Text("${user.name.firstname} ${user.name.lastname}"),
                subtitle: Text("Address: ${user.address.street}, ${user.address.city}"),
              );
            },
          );
      } ,);
  }
}