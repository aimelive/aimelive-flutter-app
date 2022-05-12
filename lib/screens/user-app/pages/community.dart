import 'package:aimelive_app/models/user_model.dart';
import 'package:aimelive_app/screens/user-app/pages/inbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class Commmunity extends StatefulWidget {
  const Commmunity({Key? key}) : super(key: key);

  @override
  State<Commmunity> createState() => _CommmunityState();
}

class _CommmunityState extends State<Commmunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg-app.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back_ios)),
                      IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.notifications_none)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hi Aimelive",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("Welcome Back 👋",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0.0),
                        hintText: "Find community around to chat with?",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.grey[400],
                        filled: true,
                        prefixIcon: IconButton(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.people_alt,
                    size: 18,
                  ),
                  Text(
                    " People you may know",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const CommunityList(),
          ],
        ),
      ),
    );
  }
}

class CommunityList extends StatefulWidget {
  const CommunityList({Key? key}) : super(key: key);

  @override
  State<CommunityList> createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  List<User> users = [
    User(
        username: "Aimelive",
        fullName: "Aime Ndayambaje",
        phone: "+25078983483737",
        email: "aimelive250@gmail.com",
        avatar: "Rectangle 21.png",
        bio: "Flutter Enthusianist"),
    User(
        username: "Ryan-fab",
        fullName: "fabrice ndacyayisenga",
        phone: "+25078983483737",
        email: "ryan-fab450@gmail.com",
        avatar: "father.jpg",
        bio: "PHP Laravel || MERN Stack"),
    User(
        username: "Gilbert Up",
        fullName: "MANZI Gilbert",
        phone: "+25078983483737",
        email: "giulzitu459@gmail.com",
        avatar: "software-skills.png",
        bio: "Network Engineer"),
  ];
  Widget userCard(user) {
    final data = User.fromJson(user.data() as Map<String, dynamic>);
    final assets = [Image(image: NetworkImage(data.avatar))];
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    SwipeImageGallery(
                      context: context,
                      children: assets,
                    ).show();
                  }),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatar),
                    radius: 26,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.fullName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.bio,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InboxChats(user: data)));
              },
              icon: const Icon(
                Icons.add_comment_sharp,
                color: Color(0xffecb22e),
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuerySnapshot?>(context);
    if (user?.docs != null) {
      return Column(
        children: user!.docs.map((userData) => userCard(userData)).toList(),
      );
    }
    return Column();
  }
}
