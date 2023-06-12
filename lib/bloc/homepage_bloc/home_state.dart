import 'package:equatable/equatable.dart';
import 'package:zesdromachinetes/model/models.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Home homeModel;
  const HomeLoaded(this.homeModel);
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}
