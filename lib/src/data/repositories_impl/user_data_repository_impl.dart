import 'package:clean_arch/src/core/errors/failure.dart';
import 'package:clean_arch/src/data/data_sources/users_data_sources.dart';
import 'package:clean_arch/src/data/models/users_data_response_model.dart';
import 'package:clean_arch/src/domain/repositories/user_data_repository.dart';
import 'package:dartz/dartz.dart';

class UserDataRepositoryImpl implements UserDataRepository{
  final UsersDataSources userdatssource;

  UserDataRepositoryImpl({required this.userdatssource});
  @override
  Future<Either<Failure, List<UserDataResponseModel>>> getuserdata() async {
    final response = await  userdatssource.getuserdata();

    return response.fold(
      (failure)=>Left(failure),
      (register) async{
            if(register.isNotEmpty){
              return Right(register);
            }
        return const Left(Failure("Api failed to call"));      }
    );
  }
}