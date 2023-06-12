import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesdromachinetes/bloc/singup_with_google/singup_event.dart';
import 'package:zesdromachinetes/bloc/singup_with_google/singup_state.dart';
// import 'package:zesdromachinetes/data/repositories/user_repository.dart';
import 'package:zesdromachinetes/screens/home/home_screen.dart';
import 'package:zesdromachinetes/screens/login/widgets/password_form.dart';
import 'package:zesdromachinetes/screens/widgets/textwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/login_active_bloc/auth_bloc.dart';
import '../../bloc/login_active_bloc/auth_event.dart';
import '../../bloc/singup_with_google/singup_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF011A3A), Color(0xFF012144)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'asset/images/moviesmodnew-Custom 1.png',
                      ),
                    ),
                  ),
                  child: Image.asset(
                    'asset/images/Frame 16.png',
                    color: Colors.white.withOpacity(0.3),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextWidget(text: 'Login'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A405A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'E-mail address',
                      ),
                    ),
                  ),
                ),
              ),
              const PasswordForm(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    print('aaa');
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0771C7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Login in',
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    dividerWidget(),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 14, color: Color(0xFF515A67)),
                    ),
                    dividerWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              loginWithGoogleButton(context),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: GoogleFonts.inter(color: const Color(0xFF9A9A9A)),
                  ),
                  Text(
                    'Sign up',
                    style: GoogleFonts.inter(color: const Color(0xFF9747FF)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container loginWithGoogleButton(context) {
    final SignupBloc signupBloc = SignupBloc();

    return Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<SignupBloc, SignupState>(
          bloc: signupBloc,
          listener: (context, state) {
            // TODO: implement listener
            if (state is SignupSuccessState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
            } else if (state is SignupErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is SignupLoadingState) {
              return OutlinedButton(
                onPressed: () {
                  signupBloc.add(SignupLoadingEvent());
                  final authBloc = BlocProvider.of<AuthBloc>(context);
                  authBloc.add(Authenticate());
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/google 1.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log in with Google',
                      style:
                          GoogleFonts.inter(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              );
            } else {
              return ElevatedButton(
                onPressed: () {
                  signupBloc.add(SignupLoadingEvent());
                  final authBloc = BlocProvider.of<AuthBloc>(context);
                  authBloc.add(Authenticate());
                },
                child: const Text('Sign Up with Google'),
              );
            }
          },
        ));
  }

  Container dividerWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 1,
      width: 145,
      color: const Color(0xFF515A67),
    );
  }
}
