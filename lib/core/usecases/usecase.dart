
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class UseCase <Type , Params>{
  Future<Either<Failure , NumberTrivia>> call(Params params);
}


class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}