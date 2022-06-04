import 'package:aimelive_app/screens/authenticate/authenticate.dart';
import 'package:aimelive_app/screens/contact.dart';
import 'package:aimelive_app/screens/feedback.dart';
import 'package:flutter/material.dart';
import 'package:aimelive_app/screens/blogs/blogs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
        title: const Text('Home'),
        elevation: 0.0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg-app.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "FREELANCE DEVELOPER",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffecb22e)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/2M8A4221.jpg"),
                        radius: 100,
                      )),
                  const Text(
                    "Hello, my name is Aime Ndayambaje",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SquarePeg'
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "I am a software developer with over 2 years of experience. This is my first Flutter Application. You're Welcome.",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding:
                                  const EdgeInsets.fromLTRB(35, 12, 35, 12),
                              primary: const Color(0xffecb22e),
                              onPrimary: Colors.white),
                          child: const Text("Projects")),
                      OutlinedButton(
                        child: const Text("Skills"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side:
                              const BorderSide(width: 2.0, color: Colors.grey),
                          onPrimary: Colors.grey[700],
                          padding: const EdgeInsets.fromLTRB(35, 12, 35, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.facebook),
                        color: const Color(0xffecb22e),
                      ),
                      IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.whatsapp),
                        color: const Color(0xffecb22e),
                      ),
                      IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.mail),
                        color: const Color(0xffecb22e),
                      ),
                      IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.call),
                        color: const Color(0xffecb22e),
                      ),
                      IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.person),
                        color: const Color(0xffecb22e),
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 2,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    color: const Color(0xffecb22e),
                  ),
                  const Image(image: AssetImage("assets/location.png")),
                  const Text(
                    "KG 729 ST",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "Kigali - Rwanda",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.copyright,
                        size: 15,
                      ),
                      Text(" Aimelive 2022"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/Rectangle 21.png"),
                      radius: 30,
                    ),
                  ),
                  Text(
                    'Aimelive App',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[500],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Blogs'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BlogsPage(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('About'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ContactPageMap(true),
                  ))
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FeedbackPage(),
                  ))
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const Authenticate()))
            },
          ),
        ],
      ),
    );
  }
}
