import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated = prefs.getBool('isAuthenticated') ?? false;

    if (isAuthenticated) {
      add(Authenticate());
    } else {
      add(Logout());
    }
  }

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Authenticate) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      yield Authenticated();
    } else if (event is Logout) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', false);
      yield Unauthenticated();
    }
  }
}
