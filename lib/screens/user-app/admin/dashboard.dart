import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        elevation: 0.0,
        backgroundColor: themeGrey,
      ),
      body: const Center(
        child: Text("On Our Way To Build Admin Panel"),
      ),
    );
  }
}
