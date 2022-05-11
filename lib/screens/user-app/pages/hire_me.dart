import 'package:flutter/material.dart';

class HireMe extends StatefulWidget {
  const HireMe({Key? key}) : super(key: key);

  @override
  State<HireMe> createState() => _HireMeState();
}

class _HireMeState extends State<HireMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
        title: const Text('Hire Me'),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg-app.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/hireme.png"),
              const Text(
                "Projects I've made",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Card(
                  shadowColor: const Color(0xfff2f2f2),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "AIMELIVE PORTFOLIO APP",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                letterSpacing: 0.8,
                                color: Colors.amber.shade400),
                          ),
                        ),
                        Image.asset("assets/software-skills.png"),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "` My first flutter application done for facilitating all of my customers. It is made of Dart language and Flutter framework for mobile applications. `",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                letterSpacing: 0.8),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "FEATURES",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                letterSpacing: 0.8),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "User can chat directly with Admin, Video call and Voice chat, External direct link to LinkedIn Account of an admin, Social Media Links, Live Chat with community around. Easily to hire an admin, read blogs and quotes, Feedback form, Login feature, Sign up with Google, Cool animations and UI. ",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffbbbbbb),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "Flutter",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffbbbbbb),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "Firebase",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffbbbbbb),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "UI/UX",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffbbbbbb),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "Node JS",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      shape: const StadiumBorder(),
                      primary: const Color(0xffecb22e),
                      onPrimary: Colors.white),
                  child: const Text("LinkedIn")),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/buymeacoffee.jpg"),
                          fit: BoxFit.cover),
                    ),
                    height: 80,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
