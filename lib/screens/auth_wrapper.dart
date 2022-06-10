import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/screens/home.dart';
import 'package:aimelive_app/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    //return either aimelive or user application
    if (user == null) {
      return const HomePage();
    } else {
      return const NavigationDrawer();
    }
  }
}
