import 'package:clean_arch/src/core/utils/url_constant.dart';
import 'package:clean_arch/src/data/api/dio_client.dart';
import 'package:clean_arch/src/data/api/result.dart';
import 'package:clean_arch/src/data/models/users_data_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

class UsersDataSources {
  final DioClient client;

  UsersDataSources({required this.client});


  Future<Either<Failure, List<UserDataResponseModel>>> getuserdata() async{

      final Result result = await client.get(UrlConstant.usersUrl);

      if( result is SucccesState ){
        List<UserDataResponseModel> jsondata = [];
        
        for(var res in result.value){
          UserDataResponseModel dataResponseModel = UserDataResponseModel.fromJson(res);
          jsondata.add(dataResponseModel);
        }
        return Right(jsondata);
      } else{
        return const Left(Failure("Somthing went Wrong"));
      }

  }
}