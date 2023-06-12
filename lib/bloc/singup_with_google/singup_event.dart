 import 'package:equatable/equatable.dart';
 abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupLoadingEvent extends SignupEvent {}

class SignupSuccessEvent extends SignupEvent {}

class SignupErrorEvent extends SignupEvent {
  final String error;

  SignupErrorEvent(this.error);

  @override
  List<Object?> get props => [error];
}
