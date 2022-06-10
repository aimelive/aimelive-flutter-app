import 'package:aimelive_app/screens/user-app/pages/components/community_list.dart';
import 'package:flutter/material.dart';

class Commmunity extends StatefulWidget {
  const Commmunity({Key? key}) : super(key: key);

  @override
  State<Commmunity> createState() => _CommmunityState();
}

class _CommmunityState extends State<Commmunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25))),
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
      ),
    );
  }
}
