
import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseYes<Type> {
  Future<Either<Failure, Type>> invoke(dynamic map);
}

abstract class UseCaseYesMultiple<Type, Type2> {
  Future<Either<Failure, Type>> invoke(dynamic map);
  Future<Either<Failure, Type2>> invokeType2();
}

abstract class UseCaseNo<Type> {
  Future<Either<Failure, Type>> invoke();
}

abstract class UseCaseList<Type> {
  Future<Either<Failure, Type>> invoke(List map);
}

abstract class UseCaseMultiple<Type> {
  Future<Either<Failure, Type>> invoke(dynamic data, dynamic data2);
}

abstract class UseCaseMultiple3<Type> {
  Future<Either<Failure, Type>> invoke(
      dynamic data, dynamic data2, dynamic data3);
}
