import 'package:clean_arch/src/core/errors/failure.dart';
import 'package:clean_arch/src/data/models/users_data_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataRepository {
  Future<Either<Failure ,List<UserDataResponseModel>>> getuserdata();
}