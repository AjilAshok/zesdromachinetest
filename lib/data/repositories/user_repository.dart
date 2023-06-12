// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class UserRepository {
//   final FirebaseAuth _firebaseAuth;
//   final GoogleSignIn _googleSignIn;
//   UserRepository()
//       : _firebaseAuth = FirebaseAuth.instance,
//         _googleSignIn = GoogleSignIn();

//   Future<void> signInWithCredentials(String email, String password) {
//     return _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<UserCredential> signUp(String email, String password) async {
//     return await _firebaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<User> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     print('print');
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     await _firebaseAuth.signInWithCredential(credential);
//     return _firebaseAuth.currentUser!;
//   }

//   Future<Future<List<void>>> signOut() async {
//     return Future.wait([
//       _firebaseAuth.signOut(),
//       _googleSignIn.signOut(),
//     ]);
//   }

//   Future<User> getUser() async {
//     return _firebaseAuth.currentUser!;
//   }
// }
