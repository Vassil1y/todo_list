import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../list/list_home.dart';
import '../../services/auth.dart';

class LogInPart extends StatefulWidget {
  LogInPart(
      {Key? key, required this.notifyParent, required this.emailController, required this.passwordController})
      : super(key: key);

  final Function() notifyParent;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  State<LogInPart> createState() => _LogInPartState();
}

class _LogInPartState extends State<LogInPart> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          label: const Text("Log In!"),
          icon: const Icon(Icons.login),
          onPressed: () async {
            User? user = await loginUsingEmailAndPassword(
                widget.emailController.text, widget.passwordController.text);

            if (user != null) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const ListHome()));
            }
          },
        ),
        TextButton(
            onPressed: () {
              widget.notifyParent();
            },
            child: const Text("Don't have account yet? Sign Up!"),
        )
      ],
    );
  }
}
