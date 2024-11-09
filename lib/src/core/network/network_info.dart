import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoI {

  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityResult;

}

class NetworkInfo implements NetworkInfoI{

    final Connectivity connectivity;
  NetworkInfo({required this.connectivity});


  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
     if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async => await connectivity.checkConnectivity();


  @override
  Stream<ConnectivityResult> get onConnectivityResult => connectivity.onConnectivityChanged;

}