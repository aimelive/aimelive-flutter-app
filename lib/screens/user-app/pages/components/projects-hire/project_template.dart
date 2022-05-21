import 'package:flutter/material.dart';

class ProjectTemplate extends StatelessWidget {
  const ProjectTemplate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
    );
  }
}
