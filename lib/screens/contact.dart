import 'package:aimelive_app/services/database.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final DatabaseService _createMessage = DatabaseService(uuid: null);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _message = TextEditingController();

    String _outputMessage = "";

    return isLoading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 161, 161, 161),
              title: const Text('Contact'),
              foregroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg-app.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      _outputMessage,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          backgroundColor: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xcef2f2f2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: const EdgeInsets.all(40),
                      margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/Rectangle 21.png"),
                            radius: 35,
                          ),
                          const Text(
                            "Reach out to Aimelive here",
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'SquarePeg',
                                color: Color(0xffecb22e)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _name,
                            decoration: InputDecoration(
                                hintText: "e.g: John Doe",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(30)),
                                labelText: "Name",
                                contentPadding:
                                    const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    icon: const Icon(Icons.person)),
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                hintText: "example@gmail.com",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(30)),
                                labelText: "Email",
                                contentPadding:
                                    const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    icon: const Icon(Icons.mail)),
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _message,
                            decoration: InputDecoration(
                                hintText: "Your message",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                    borderRadius: BorderRadius.circular(18)),
                                fillColor: Colors.white,
                                filled: true),
                            maxLines: 5,
                            maxLength: 500,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic resp = await _createMessage.createMessage(
                                  _name.text, _email.text, _message.text);
                              if (resp == null) {
                                setState(() {
                                  _outputMessage =
                                      "An error occured, We couldn't send your message";
                                  isLoading = false;
                                });
                                print(
                                    "An error occured, We couldn't send your message");
                              } else {
                                print("Message sent successfully!");
                                setState(() {
                                  _outputMessage = "Message sent successfully";
                                  isLoading = false;
                                });
                              }
                            },
                            child: const Text(" Send "),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffecb22e),
                                onPrimary: Colors.white,
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const Text("For further help, Please visit our FAQs")
                  ],
                ),
              ),
            ));
  }
}
