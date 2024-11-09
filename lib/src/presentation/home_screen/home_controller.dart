import 'package:clean_arch/injector.dart';
import 'package:clean_arch/src/core/errors/failure.dart';
import 'package:clean_arch/src/core/utils/state_enums.dart';
import 'package:clean_arch/src/data/models/users_data_response_model.dart';
import 'package:clean_arch/src/domain/usescases/user_data_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'dart:async';


import '../../core/network/network_info.dart';

class HomeController extends GetxController {

  final network = injector<NetworkInfoI>();
 final viewstate = ViewState.inital.obs;
  final connectvityResult = ConnectivityResult.none.obs;
 UserDataResponseModel? userDataResponseModel;
    final historyViewState = <ViewState>[];
List usedata = [];
late Either<Failure , List<UserDataResponseModel>> failureoruserresponse;
final userdatausecase = injector<UserDataUsecase>();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;


@override
  void onInit() async {
    super.onInit();
      connectvityResult.value = await network.connectivityResult;
      connectivitySubscription = network.onConnectivityResult.listen((result) {
      connectvityResult.value = result; // Update connectivity result on change
      
      // Handle any additional logic when connectivity changes
      if (result == ConnectivityResult.none) {
        Get.snackbar("No Connection", "You are offline, please check your connection.");
      } else {
        Get.snackbar("Connected", "Back online!");
      }
    });
    await userdatacall();
  }


  void _setState(ViewState state) {
    viewstate.value = state;
     historyViewState.add(state);
  }

  userdatacall() async{
    if(viewstate.value == ViewState.busy) return;
      if (connectvityResult.value == ConnectivityResult.none) {
      //print("Can't refresh when offline");
     Get.snackbar( "Error",
          "Please connect your device to wifi or mobile network");
      return;
    }
    _setState(ViewState.busy);

    failureoruserresponse = await userdatausecase.call();
    handlefetechresult(failureoruserresponse);
     update();
  }

  void handlefetechresult(
    Either<Failure, List<UserDataResponseModel>> result
  ){
      result.fold(
        (l) {
          _setState(ViewState.error);
         Get.snackbar("Errror", l.message);
        },
        (data) {
          Get.snackbar("succes", 
          "Mubaraaaaaaaaaaaaaaaak");
          print("My dataaaaaaaa: $data");
            _setState(ViewState.data);
              usedata.clear(); 
            usedata.addAll(data);
        },
      );
  }

   @override
  void onClose() {
    // Cancel the subscription when the controller is closed
    super.onClose();
    connectivitySubscription.cancel();  // Cleanup the stream listener
  }

}