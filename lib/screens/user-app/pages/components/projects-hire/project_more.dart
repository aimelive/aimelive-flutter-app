import 'package:aimelive_app/models/project_model.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final Project project;
  const ProjectDetails({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final projectDetailScreens = [
      ProjectDetailsPart(project: widget.project),
      const ProjectDetailsHire(),
      const ProjectDetailsAbout(),
    ];
    return Scaffold(
      backgroundColor: themePrimaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: themeWhiteColor,
                ),
              ),
              title: Text(
                widget.project.title,
                style: const TextStyle(color: themeWhiteColor),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: themeWhiteColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: themeWhiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                  child: projectDetailScreens[currentIndex]),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: themePrimaryColor,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Project'),
          BottomNavigationBarItem(icon: Icon(Icons.flare_sharp), label: 'Hire'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'About'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.message),
        label: const Text("Hire me"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: themePrimaryColor.withOpacity(0.9),
        elevation: 0.0,
      ),
    );
  }
}

class ProjectDetailsPart extends StatefulWidget {
  final Project project;
  const ProjectDetailsPart({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectDetailsPart> createState() => _ProjectDetailsPartState();
}

class _ProjectDetailsPartState extends State<ProjectDetailsPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: themePrimaryColor,
            backgroundImage: AssetImage('assets/Rectangle 21.png'),
          ),
          title: Text(widget.project.author),
          subtitle: const Text("Flutter Developer"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        Image.asset("assets/${widget.project.featurePhoto}"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.project.title,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: 0.8,
                color: Colors.amber.shade400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.project.description,
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 18, letterSpacing: 0.8),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "FEATURES",
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 18, letterSpacing: 0.8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.project.features,
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 18, letterSpacing: 0.8),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.project.tags.map((tag) => tagCard(tag)).toList(),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: padding, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "COMMUNITY VIEW",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeGrey),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: themeGrey),
                    borderRadius: BorderRadius.circular(3)),
                child: const Text(
                  "24 Accessed",
                  style: TextStyle(fontSize: 12, color: themeGrey),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(18)),
              padding: const EdgeInsets.all(15),
              height: 80,
              child: const Text(
                "25\nHappy :)",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: themeWhiteColor),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(18)),
              padding: const EdgeInsets.all(15),
              height: 80,
              child: const Text(
                "5\nSatisfied :)",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: themeWhiteColor),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(18)),
              padding: const EdgeInsets.all(15),
              height: 80,
              child: const Text(
                "0\nUnappy :(",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: themeWhiteColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: padding, vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                hintText: "Say something...",
                hintStyle: const TextStyle(color: themePrimaryColor),
                fillColor: themeLighterGrey,
                filled: true,
                prefixIcon: IconButton(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                  color: themePrimaryColor,
                )),
          ),
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }

  Widget tagCard(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xffbbbbbb),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ProjectDetailsHire extends StatefulWidget {
  const ProjectDetailsHire({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsHire> createState() => _ProjectDetailsHireState();
}

class _ProjectDetailsHireState extends State<ProjectDetailsHire> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: const [
          Text(
            "This project is currently hired 11 employers. ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Current client is AIME NDAYAMBAJE ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Current client is AIME NDAYAMBAJE ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ProjectDetailsAbout extends StatefulWidget {
  const ProjectDetailsAbout({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsAbout> createState() => _ProjectDetailsAboutState();
}

class _ProjectDetailsAboutState extends State<ProjectDetailsAbout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: const [
          Text(
            "Kindly my profile is this.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "View gallery of the photo.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Kindly my profile is this.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
