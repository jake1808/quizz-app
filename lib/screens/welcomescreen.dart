import 'package:flutter/material.dart';

import 'package:quizz_app/pages/loginpage.dart';
import 'package:quizz_app/pages/registrationPage.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  final pageController = PageController(initialPage: 0);

  void setPage() {
    setState(() {
      pageController.jumpToPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: [
        LoginPage(
            formkey: formkey,
            emailField: emailField,
            passwordField: passwordField),
        RegistartionPage(
            formkey: formkey,
            emailField: emailField,
            passwordField: passwordField)
      ],
    ));
  }
}
