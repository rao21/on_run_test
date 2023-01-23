import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class SerivceFailure extends Failure {
  @override
  List<Object> get props => [];
}