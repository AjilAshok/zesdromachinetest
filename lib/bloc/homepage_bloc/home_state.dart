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
  final Home homeModel2;
  const HomeLoaded(
    this.homeModel,this.homeModel2
  );
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}
