import 'package:aimelive_app/screens/user-app/admin/panels/post_panel.dart';
import 'package:aimelive_app/screens/user-app/admin/panels/project_panel.dart';
import 'package:aimelive_app/screens/user-app/admin/panels/user_panel.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: themeWhiteColor,
        appBar: AppBar(
          title: const Text("Admin Panel"),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: themeWhiteColor,
          foregroundColor: themeGrey,
          actions: const [
            Icon(
              Icons.search,
              size: 28.0,
              color: themePrimaryColor,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.notifications),
            SizedBox(
              width: 20.0,
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.home,
                      color: black,
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(color: black),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.trending_up,
                      color: black,
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(color: black),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.person,
                      color: black,
                    ),
                    Text(
                      "Users",
                      style: TextStyle(color: black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PostPanel(),
            ProjectsPanel(),
            UserPanel(),
          ],
        ),
      ),
    );
  }
}
