import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPart extends StatefulWidget {
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
  State<SignUpPart> createState() => _SignUpPartState();
}

class _SignUpPartState extends State<SignUpPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          icon: const Icon(Icons.assignment),
          label: const Text("Sign Up!"),
          onPressed: () {
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: widget.emailController.text,
                password: widget.passwordController.text);
            widget.notifyParent();
          },
        ),
        TextButton(
          onPressed: () {
            widget.notifyParent();
          },
          child: const Text("Already have account? Log in!"),
        )
      ],
    );
  }
}
