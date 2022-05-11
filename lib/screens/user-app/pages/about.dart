import 'package:aimelive_app/screens/user-app/pages/user_profile.dart';
import 'package:aimelive_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final assets = const [
    Image(image: AssetImage('assets/photo1.jpg')),
    Image(image: AssetImage('assets/photo2.jpg')),
    Image(image: AssetImage('assets/photo3.jpg')),
  ];
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void onSelected(BuildContext context, int item) async {
      switch (item) {
        case 0:
          //print("Print clicked settings");
          break;
        case 1:
          //print("Print clicked share");
          break;
        case 2:
          await _auth.logOut();
          break;
      }
    }

    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uuid: null).userData,
      initialData: null,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              stretch: true,
              // floating: true,
              //centerTitle: false,
              pinned: true,
              backgroundColor: Colors.grey,
              leading: const Icon(Icons.menu),
              elevation: 0.0,
              actions: [
                Theme(
                  data: Theme.of(context).copyWith(
                      iconTheme: const IconThemeData(color: Colors.white),
                      dividerColor: Colors.white,
                      textTheme:
                          const TextTheme().apply(bodyColor: Colors.white)),
                  child: PopupMenuButton<int>(
                    color: const Color(0xffecb22e),
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Settings"),
                            ],
                          )),
                      PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.share),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Share"),
                            ],
                          )),
                      const PopupMenuDivider(),
                      PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.logout),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Sign Out"),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/photo1.jpg",
                  fit: BoxFit.cover,
                ),
                //collapseMode: CollapseMode.pin,
                title: const Text("Aimelive"),
                //centerTitle: false,
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Text(
                    "Aime Ndayambaje",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {
                              SwipeImageGallery(
                                context: context,
                                children: assets,
                              ).show();
                            },
                            icon: const Icon(Icons.camera_alt),
                            label: const Text("View Photos")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton.icon(
                            onPressed: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  )),
                                  context: context,
                                  builder: (context) => buildSheet(),
                                ),
                            icon: const Icon(Icons.high_quality),
                            label: const Text("Profile")),
                      ],
                    ),
                  ),
                  const Text("Discover more people"),
                  const UserProfile()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makedismissable({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makedismissable(
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            padding: const EdgeInsets.all(16),
            child: ListView(
              controller: controller,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/photo1.jpg"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Aimelive",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome here, I am a freelance developer with over 2 years of experience in the game",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Chat with me"),
                )
              ],
            ),
          ),
        ),
      );
}
