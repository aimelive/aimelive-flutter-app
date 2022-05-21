import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/screens/home.dart';
import 'package:aimelive_app/screens/user-app/pages/components/community_list.dart';
import 'package:aimelive_app/services/auth.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

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

  final double coverHeight = 150;
  final double profileHeight = 140;
  bool isUpdating = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
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
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => const HomePage())),
              (route) => false);
          break;
      }
    }

    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: AssetImage("assets/photo2.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Aimelive"),
          ],
        ),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white),
                dividerColor: Colors.white,
                textTheme: const TextTheme().apply(bodyColor: Colors.white)),
            child: PopupMenuButton<int>(
              color: const Color(0xffecb22e),
              icon: const Icon(Icons.more_vert),
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
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: DatabaseService(uuid: user?.uuid).currentUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot? data = snapshot.data;
              final userModelData = ActiveUser.fromJsonUser(
                  data?.data() as Map<String, dynamic>, user!.uuid);
              return ListView(children: [
                //Text(userModelData.fullName),
                buildTop(top, userModelData.avatar),
                buildContent(userModelData.fullName)
              ]);
            } else {
              return const Loading();
            }
          }),
    );
  }

  Stack buildTop(double top, String avatar) {
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          Positioned(top: top, child: buildProfileImage(avatar))
        ]);
  }

  Widget buildContent(String fullName) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              fullName,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    SwipeImageGallery(
                      context: context,
                      children: assets,
                    ).show();
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("View Photos"),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.grey),
                    onPrimary: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text("Profile"),
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
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.grey),
                    onPrimary: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text("Discover more people"),
                ],
              ),
            ),
            const CommunityList()
          ],
        ),
      );
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/code.jpeg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage(String avatar) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: NetworkImage(avatar),
        ),
      );

  Widget makedismissable({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() {
    final user = Provider.of<AppUser?>(context);
    return makedismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.8,
        builder: (_, controller) => StreamBuilder<DocumentSnapshot>(
            stream: DatabaseService(uuid: user?.uuid).currentUserData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DocumentSnapshot? data = snapshot.data;
                final userModelData = ActiveUser.fromJsonUser(
                    data?.data() as Map<String, dynamic>, user!.uuid);

                final TextEditingController _username =
                    TextEditingController(text: userModelData.username);
                final TextEditingController _fullName =
                    TextEditingController(text: userModelData.fullName);
                final TextEditingController _bio =
                    TextEditingController(text: userModelData.bio);
                final TextEditingController _phone =
                    TextEditingController(text: userModelData.phone);

                //print(userModelData.email);
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    controller: controller,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(userModelData.avatar),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text("Upload Photo")),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _username,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelText: "Username"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _fullName,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelText: "Full Name"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _bio,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelText: "Bio"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phone,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelText: "Phone"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isUpdating = true;
                          });
                          await DatabaseService(uuid: user.uuid)
                              .createUserProfile(
                                  userModelData.email,
                                  _fullName.text,
                                  _phone.text,
                                  userModelData.avatar,
                                  _username.text,
                                  _bio.text);
                          Navigator.of(context).pop();
                        },
                        child: isUpdating
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Update"),
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                );
              } else {
                return const Loading();
              }
            }),
      ),
    );
  }
}
