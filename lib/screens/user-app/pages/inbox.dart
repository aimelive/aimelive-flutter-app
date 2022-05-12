import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:aimelive_app/models/user_model.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class InboxChats extends StatefulWidget {
  final User user;
  const InboxChats({required this.user});

  @override
  State<InboxChats> createState() => _InboxChatsState();
}

class _InboxChatsState extends State<InboxChats> {
  @override
  Widget build(BuildContext context) {
    final assets = [Image(image: NetworkImage(widget.user.avatar))];

    void onSelected(BuildContext context, int item) {
      switch (item) {
        case 0:
          //print("Print clicked settings");
          break;
        case 1:
          //print("Print clicked share");
          break;
        case 2:
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
        title: Row(
          children: [
            GestureDetector(
              onTap: (() {
                SwipeImageGallery(
                  context: context,
                  children: assets,
                ).show();
              }),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.avatar),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user.username),
                const Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        foregroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
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
                        Icon(Icons.person_rounded),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Profile"),
                      ],
                    )),
                PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(Icons.face),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Hire me"),
                      ],
                    )),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.notifications),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Notifications"),
                      ],
                    )),
                PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: const [
                        Icon(Icons.wifi_protected_setup),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Progress"),
                      ],
                    )),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 4,
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Quit"),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg-app.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DateChip(
                              date: DateTime(2022, 4, 23),
                              color: const Color(0x558AD3D5),
                            ),
                            const BubbleSpecialThree(
                              text: "Hi, how are you? ",
                              color: Color(0xFFE8E8EE),
                              tail: false,
                              isSender: false,
                            ),
                            const BubbleSpecialThree(
                              text:
                                  'Can you make an awesome application for me?',
                              color: Color(0xFFE8E8EE),
                              tail: false,
                              isSender: false,
                            ),
                            const BubbleSpecialThree(
                              text:
                                  'Yes I can, which kind of application do you need?',
                              color: Color(0xFF1B97F3),
                              tail: true,
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const BubbleSpecialThree(
                              text:
                                  'Sure, The one for managing our home materials, Every time we loose where we keep our things.',
                              color: Color(0xFFE8E8EE),
                              tail: false,
                              isSender: false,
                            ),
                            const BubbleSpecialThree(
                              text: "Alright, I can do.",
                              color: Color(0xFF1B97F3),
                              tail: true,
                              isSender: true,
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const BubbleSpecialThree(
                              text: "Thanks",
                              color: Color(0xFFE8E8EE),
                              tail: true,
                              isSender: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              color: const Color(0xffdddddd),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Type message",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Message not sent"),
                            action:
                                SnackBarAction(label: "OK", onPressed: () {}),
                          ));
                        },
                        padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                        icon: const Icon(Icons.send)),
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20)),
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      //   color: const Color(0xffdddddd),
      //   child: TextField(
      //     decoration: InputDecoration(
      //         hintText: "Type message",
      //         enabledBorder: OutlineInputBorder(
      //             borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      //             borderRadius: BorderRadius.circular(30)),
      //         focusedBorder: OutlineInputBorder(
      //             borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      //             borderRadius: BorderRadius.circular(30)),
      //         contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
      //         fillColor: Colors.white,
      //         filled: true,
      //         suffixIcon: IconButton(
      //             onPressed: () {
      //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //                 content: const Text("Message not sent"),
      //                 action: SnackBarAction(label: "OK", onPressed: () {}),
      //               ));
      //             },
      //             padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
      //             icon: const Icon(Icons.send)),
      //         labelStyle: const TextStyle(color: Colors.grey, fontSize: 20)),
      //     keyboardType: TextInputType.name,
      //   ),
      // ),
    );
  }
}
