import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}

class NoParam {}
