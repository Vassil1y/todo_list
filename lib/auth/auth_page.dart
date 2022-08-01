import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/list/list_home.dart';
import 'package:todo_list/services/auth.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Log In"),
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
              ),
              TextButton(
                  onPressed: () async {
                    User? user = await loginUsingEmailAndPassword(
                        emailController.text, passwordController.text);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => ListHome()));
                    }
                  },
                  child: const Text("Forward"))
            ],
          )),
    );
  }
}
