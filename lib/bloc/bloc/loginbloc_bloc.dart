import 'package:bloc/bloc.dart';
import 'package:zesdromachinetes/resources/auth_reposotory.dart';

import 'loginbloc_event.dart';
import 'loginbloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<LoginWithEmailEvent>(_handleLoginWithEmail);
  }

  void _handleLoginWithEmail(
      LoginWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authRepository.loginWithEmail(event.email, event.password);
      emit(AuthLoggedIn());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
