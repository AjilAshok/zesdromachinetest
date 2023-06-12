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
        final mList = await _apiRepository.fetchCovidList();
        emit(HomeLoaded(mList));
        // if (mList.error != null) {
        //   emit(HomeError(mList.error));
        // }
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
