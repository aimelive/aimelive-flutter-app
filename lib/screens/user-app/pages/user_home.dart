import 'package:aimelive_app/screens/user-app/pages/community.dart';
import 'package:aimelive_app/screens/user-app/shared/app_bar.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar("Home") as PreferredSizeWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Commmunity(),
              ));
        },
        child: const Icon(Icons.message),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
    );
  }
}
