import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPart extends StatelessWidget {
  SignUpPart(
      {Key? key,
      required this.notifyParent,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  final Function() notifyParent;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          icon: const Icon(Icons.assignment),
          label: const Text("Sign Up!"),
          onPressed: () {
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text);
            notifyParent();
          },
        ),
        TextButton(
          onPressed: () {
            notifyParent();
          },
          child: const Text("Already have account? Log in!"),
        )
      ],
    );
  }
}
