import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeList extends HomeEvent {}

// class GetPopularList extends HomeEvent {}
