import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/models/chat_message.dart';
import 'package:aimelive_app/screens/user-app/pages/components/chat_input_field.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:aimelive_app/models/user_model.dart';
import 'package:provider/provider.dart';
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

    final senderUser = Provider.of<AppUser?>(context);
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
                Text(
                  widget.user.username,
                  overflow: TextOverflow.fade,
                ),
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder<QuerySnapshot>(
                  stream: DatabaseService(uuid: senderUser?.uuid)
                      .chatMessage(senderUser?.uuid, widget.user.userId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot? data = snapshot.data;
                      final chats = data!.docs
                          .map((doc) => ChatModel.fromJsonMessage(
                              doc.data() as Map<String, dynamic>, doc.id))
                          .toList();
                      //print(chats.length);
                      return ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) => messageDisplay(
                            chats[index].messageString,
                            chats[index].senderId == senderUser?.uuid
                                ? true
                                : false,
                            index + 1 == chats.length ? true : false),
                      );
                    } else {
                      return const Loading();
                    }
                  }),
            ),
          ),
          ChatInputField(receiverId: widget.user.userId),
        ],
      ),
    );
  }

  BubbleSpecialThree messageDisplay(
      String message, bool isSender, bool isLast) {
    return BubbleSpecialThree(
      text: message,
      color: isSender ? const Color(0xFF1B97F3) : const Color(0xFFE8E8EE),
      tail: isLast,
      isSender: isSender,
      textStyle: TextStyle(
          color: isSender ? Colors.white : Colors.black87, fontSize: 16),
    );
  }
}
