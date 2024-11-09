
import 'package:clean_arch/src/data/api/dio_client.dart';
import 'package:clean_arch/src/data/data_sources/users_data_sources.dart';
import 'package:clean_arch/src/data/repositories_impl/user_data_repository_impl.dart';
import 'package:clean_arch/src/domain/repositories/user_data_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import 'src/core/network/network_info.dart';
import 'src/domain/usescases/user_data_usecase.dart';

GetIt injector = GetIt.instance;


Future<void> initializeDependencies() async {
  
 // CONNECTIVITY
  injector.registerSingleton<Connectivity>(Connectivity());
  
  // NETWORK
  injector
      .registerSingleton<NetworkInfoI>(NetworkInfo(connectivity: injector()));
      
  // Dio client
  injector.registerSingleton<DioClient>(DioClient());


  //data sources

  injector.registerSingleton<UsersDataSources>(UsersDataSources(client: injector()));

  //repositories
  injector.registerSingleton<UserDataRepository>(
    UserDataRepositoryImpl(userdatssource: injector())
  );

  injector.registerSingleton<UserDataUsecase>(UserDataUsecase(userDataRepository: injector()));
}