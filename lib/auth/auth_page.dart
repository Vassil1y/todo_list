import 'package:flutter/material.dart';
import 'package:todo_list/auth/buttons_parts/log_in_part.dart';
import 'package:todo_list/auth/buttons_parts/sign_up_part.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool show = true;

  void answerToKid() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome!"),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Введите почту",
                  fillColor: Colors.black12,
                  filled: true,
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "********",
                    fillColor: Colors.black12,
                    filled: true),
              ),
              (show
                  ? LogInPart(
                      notifyParent: answerToKid,
                      emailController: emailController,
                      passwordController: passwordController)
                  : SignUpPart(
                      notifyParent: answerToKid,
                      emailController: emailController,
                      passwordController: passwordController))
            ],
          )),
    );
  }
}
