import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesdromachinetes/screens/home/home_screen.dart';
import 'package:zesdromachinetes/screens/login/login.dart';

import 'auth_bloc.dart';
import 'auth_state.dart';

class AuthGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print(state);
        if (state is Authenticated) {
          return const LoginScreen();
        } else {
          return const Homepage();
        }
      },
      buildWhen: (previous, current) => previous != current,
      // create: (_) => authBloc..add(CheckAuthentication()),
    );
  }
}
