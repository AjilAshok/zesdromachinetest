import 'package:bloc/bloc.dart';
import 'package:zesdromachinetes/bloc/homepage_bloc/home_event.dart';
import 'package:zesdromachinetes/bloc/homepage_bloc/home_state.dart';
import 'package:zesdromachinetes/resources/api_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetHomeList>((event, emit) async {
      try {
        emit(HomeLoading());
        final List mList = await Future.wait([
          _apiRepository.fetchTrendList(),
          _apiRepository.fetechPopular(),
        ]);
        final treniLst = mList[0];
        final popularList = mList[1];
        //     final mList = await _apiRepository.fetchTrendList();

        emit(HomeLoaded(treniLst, popularList));
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
