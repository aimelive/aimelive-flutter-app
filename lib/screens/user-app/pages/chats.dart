import 'package:aimelive_app/screens/user-app/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:aimelive_app/models/inbox_room_messages.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aimelive_app/models/user_model.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  //List<int> items = List<int>.generate(10, (int index) => index);
  List<Message> messages = [
    Message(
        messageId: "message1",
        username: "Aimelive",
        message: "Hi bro, you are missed a lot!",
        avatar: "Rectangle 21.png",
        when: "Today",
        length: 2),
    Message(
        messageId: "message2",
        username: "Ryan-fab",
        message: "Hahhhhhhh😂😂 you made my day",
        avatar: "father.jpg",
        when: "2 min",
        length: 1),
    Message(
        messageId: "message3",
        username: "Gilbert Up",
        message: "Alright, Thanks!",
        avatar: "software-skills.png",
        when: "Yesterday",
        length: 7),
  ];
  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight = 80;
    return Scaffold(
      appBar: myCustomAppBar("Chats room") as PreferredSizeWidget,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Online Users",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: cardHeight,
                child: onlineUsers(cardHeight),
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Recent Chats",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          background: Container(
                            color: Colors.grey[300],
                          ),
                          key: ValueKey<Message>(messages[index]),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              messages.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Chat deleted'),
                              action: SnackBarAction(
                                  label: "UNDO", onPressed: () {}),
                            ));
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/${messages[index].avatar}"),
                                radius: 26,
                              ),
                              onTap: () {},
                              title: Text(
                                messages[index].username,
                              ),
                              subtitle: Text(messages[index].message),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 3.5),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffecb22e),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Text(
                                      "${messages[index].length}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    messages[index].when,
                                    style: TextStyle(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView onlineUsers(double cardHeight) {
    final user = Provider.of<QuerySnapshot?>(context);
    if (user?.docs != null) {
      return ListView.builder(
          itemCount: user!.docs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final data =
                User.fromJson(user.docs[index].data() as Map<String, dynamic>);
            return Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: cardHeight - 20,
                    height: cardHeight - 20,
                    color: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data.avatar),
                    ),
                  ),

                  ///Text(data.username)
                ],
              ),
            );
          });
    }
    return ListView();
  }
}
