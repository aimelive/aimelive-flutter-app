import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/screens/blogs/blogs_page.dart';
import 'package:aimelive_app/screens/contact.dart';
import 'package:aimelive_app/screens/feedback.dart';
import 'package:aimelive_app/screens/user-app/admin/dashboard.dart';
import 'package:aimelive_app/screens/user-app/screen_wrapper.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    Widget getScreen() {
      switch (currentItem) {
        case MenuItems.home:
          return const ScreenWrapper();
        case MenuItems.blogs:
          return const BlogsPage();
        case MenuItems.about:
          return const ContactPageMap(false);
        case MenuItems.help:
        default:
          return const FeedbackPage();
      }
    }

    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: themeGrey,
      borderRadius: 40,
      angle: -5,
      slideWidth: MediaQuery.of(context).size.width * 0.6,
      showShadow: true,
      drawerShadowsBackgroundColor: themePrimaryColor,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuPage(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        );
      }),
    );
  }
}

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const blogs = MenuItem('Blogs', Icons.newspaper);
  static const notification = MenuItem('Notification', Icons.notifications);
  static const help = MenuItem('Help', Icons.help);
  static const about = MenuItem('About Us', Icons.info_outline);
  static const rate = MenuItem('Rate Us', Icons.star_border_outlined);
  static const all = <MenuItem>[home, blogs, notification, help, about, rate];
}

class MenuItem {
  final String title;
  final IconData icon;
  const MenuItem(this.title, this.icon);
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    Widget buildMenuItem(MenuItem item) => ListTileTheme(
          selectedColor: Colors.white,
          child: ListTile(
            selected: currentItem == item,
            selectedTileColor: themePrimaryColor.withOpacity(0.7),
            minLeadingWidth: 20,
            leading: Icon(item.icon),
            title: Text(item.title),
            onTap: () => onSelectedItem(item),
          ),
        );
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: themeGrey.withOpacity(0.0),
        body: StreamBuilder<DocumentSnapshot>(
          stream: DatabaseService(uuid: user?.uuid).currentUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userInfo = ActiveUser.fromJsonUser(
                  snapshot.data?.data() as Map<String, dynamic>, user!.uuid);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  ...MenuItems.all.map(buildMenuItem).toList(),
                  if (userInfo.role == "admin")
                    ListTile(
                      title: const Text("Dashboard"),
                      leading: const Icon(Icons.dashboard),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Dashboard()));
                      },
                    ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              );
            } else {
              return Column(
                children: const [
                  Spacer(),
                  Text("Oops! Sorry, We couldn't get User Info."),
                  Spacer()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
        icon: const Icon(
          Icons.menu,
          color: themeWhiteColor,
        ));
  }
}
