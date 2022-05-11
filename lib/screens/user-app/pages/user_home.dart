import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Aimelive"),
          centerTitle: true,
          backgroundColor: Colors.grey,
          elevation: 0.0,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            const SizedBox(
              width: 10,
            )
          ]),
      body: ListView(children: [buildTop(top), buildContent()]),
    );
  }

  Stack buildTop(double top) {
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          Positioned(top: top, child: buildProfileImage())
        ]);
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/photo1.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage("assets/Rectangle 21.png"),
      );
  Widget buildContent() => Container(
        padding: const EdgeInsets.all(8.0),
        child: const Text("Programmer is well organised in this world of joy"),
      );
}
