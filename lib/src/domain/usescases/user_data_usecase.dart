import 'package:clean_arch/src/core/errors/failure.dart';
import 'package:clean_arch/src/core/use_cases/usecasees.dart';
import 'package:clean_arch/src/data/models/users_data_response_model.dart';
import 'package:clean_arch/src/domain/repositories/user_data_repository.dart';
import 'package:dartz/dartz.dart';

class UserDataUsecase implements UseCase<List<UserDataResponseModel>> {

  final UserDataRepository userDataRepository;

  UserDataUsecase({ required this.userDataRepository});
  @override
  Future<Either<Failure, List<UserDataResponseModel>>> call() {
    return userDataRepository.getuserdata();
  }


}