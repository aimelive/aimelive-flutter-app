import 'package:aimelive_app/screens/user-app/pages/about.dart';
import 'package:aimelive_app/screens/user-app/pages/chats.dart';
import 'package:aimelive_app/screens/user-app/pages/community.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/projects.dart';
import 'package:aimelive_app/screens/user-app/pages/user_home.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  final items = <Widget>[
    const Icon(
      Icons.chat,
      size: 30,
    ),
    const Icon(
      Icons.search,
      size: 30,
    ),
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
    ),
    const Icon(
      Icons.person,
      size: 30,
    ),
  ];

  int index = 2;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  PageController pageViewController = PageController();

  final screens = [
    const ChatsList(),
    const Commmunity(),
    const UserHome(),
    ProjectsHire(),
    const AboutPage(),
  ];
  @override
  void initState() {
    super.initState();
    pageViewController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uuid: null).userData,
      initialData: null,
      catchError: (context, error) {
        print('An error occured $error');
        return null;
      },
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: pageViewController,
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          children: [
            const ChatsList(),
            const Commmunity(),
            const UserHome(),
            ProjectsHire(),
            const AboutPage(),
          ],
        ),
        //body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.amber,
            color: const Color(0xffecb22e),
            items: items,
            index: index,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                pageViewController.jumpToPage(index);
                this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
