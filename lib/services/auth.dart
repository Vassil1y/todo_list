import 'package:firebase_auth/firebase_auth.dart';

Future<User?> loginUsingEmailAndPassword(String email, String password) async {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential = await _fAuth.signInWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  return user;
}
