import 'package:aimelive_app/screens/authenticate/login.dart';
import 'package:aimelive_app/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(goToSignUp: toggleView);
    } else {
      return SignUp(goToLogin: toggleView);
    }
  }
}
