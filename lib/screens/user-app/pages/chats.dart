import 'package:flutter/material.dart';
import 'package:aimelive_app/models/inbox_room_messages.dart';

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
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
        title: const Text('Chats'),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg-app.jpg"), fit: BoxFit.cover),
          ),
          child: RefreshIndicator(
            onRefresh: _refresh,
            color: const Color(0xffecb22e),
            edgeOffset: 0,
            child: ListView.builder(
              itemCount: messages.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
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
                      action: SnackBarAction(label: "UNDO", onPressed: () {}),
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/${messages[index].avatar}"),
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
                                borderRadius: BorderRadius.circular(25)),
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
          )),
    );
  }
}
