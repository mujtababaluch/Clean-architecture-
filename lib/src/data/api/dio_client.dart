import 'dart:io';

import 'package:clean_arch/src/core/utils/constants.dart';
import 'package:clean_arch/src/data/api/dio_exceptions.dart';
import 'package:dio/dio.dart';

import 'result.dart';

class DioClient {
  static const int  timeOutInSeconds = 50;

  BaseOptions options = BaseOptions(
connectTimeout: const Duration(milliseconds: 10000),
receiveTimeout:  const Duration(milliseconds: 10000),
  ); 

  late final Dio dio = Dio(options);

  //Get
  Future<Result> get(String? api) async{
    var url = Constants.baseUrl + api!;
      dio.options.headers['Content-Type'] = Headers.jsonContentType;
      //dio.options.headers["Authorization"] = "Bearer ${Constants.bearerToken}";
    try{
      Response response = await dio.get(
        url,
        options: Options(contentType:  Headers.jsonContentType)
        
      );
      print("Response : ${response.data.toString()}");
     return Result.success(response.data);
    }
    on DioException catch(e){ 
        if(e.error !=null && e.error is SocketException){
            print('Error : ${e.message!}');
        return Result.networkError('Please verify your internet connection');
        }
      var errormsg = DioExceptions.fromDioError(e).toString();

    print('Error : ${e.response?.data.toString()}');
      return Result.error(errormsg);
    } catch (err) {
      print(err.toString());
      return Result.error(err.toString());
    }

  }

}