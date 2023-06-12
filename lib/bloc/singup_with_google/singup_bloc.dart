import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zesdromachinetes/bloc/singup_with_google/singup_event.dart';
import 'package:zesdromachinetes/bloc/singup_with_google/singup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignupBloc() : super(SignupLoadingState()) {
    on<SignupLoadingEvent>((event, emit) {
      emit(SignupLoadingState());
      _handleSignup();
    });
  }

  Future<void> _handleSignup() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(SignupSuccessState());
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(SignupErrorState('Failed to sign up'));
      }
    } catch (e) {
      print(e);
      // ignore: invalid_use_of_visible_for_testing_member
      emit(SignupErrorState('Error: $e'));
    }
  }
}
