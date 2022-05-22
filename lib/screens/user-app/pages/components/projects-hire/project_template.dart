import 'package:aimelive_app/models/project_model.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/project_more.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ProjectTemplate extends StatelessWidget {
  final Project project;
  const ProjectTemplate({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shadowColor: const Color(0xfff2f2f2),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: themePrimaryColor,
                  backgroundImage: AssetImage('assets/Rectangle 21.png'),
                ),
                title: Text(project.author),
                subtitle: const Text("Flutter Developer"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ),
              Image.asset("assets/${project.featurePhoto}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  project.title,
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
                  project.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      letterSpacing: 0.8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Divider(
                  color: themeLightGrey?.withOpacity(0.6),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: themePrimaryColor,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.2)),
                    ),
                    child: const Text("Hire"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: themePrimaryColor,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.2),
                      ),
                    ),
                    child: const Text("Creator"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProjectDetails(project: project),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: themePrimaryColor,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.2)),
                    ),
                    child: const Text("More"),
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
