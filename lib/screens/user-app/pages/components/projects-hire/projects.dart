import 'package:aimelive_app/screens/navigation_drawer.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/categories.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/constants.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/project_template.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ProjectsHire extends StatefulWidget {
  @override
  _ProjectsHireState createState() => _ProjectsHireState();
}

class _ProjectsHireState extends State<ProjectsHire> {
  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: const BoxDecoration(
                    color: themePrimaryColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(5))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: MenuWidget(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Aimelive App',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height: 120,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : categoryHeight,
                  child: categoriesScroller),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  controller: controller,
                  itemCount: projects.length,
                  itemBuilder: (context, index) =>
                      ProjectTemplate(project: projects[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    //path.moveTo(0, 100);
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 50, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
