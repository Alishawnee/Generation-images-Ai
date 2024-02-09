import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call(Parameter parameter);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
