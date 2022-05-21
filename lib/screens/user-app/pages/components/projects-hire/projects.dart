import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/categories.dart';
import 'package:aimelive_app/screens/user-app/pages/components/projects-hire/project_template.dart';
import 'package:aimelive_app/screens/user-app/shared/app_bar.dart';
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
      appBar: myCustomAppBar("Hire Me") as PreferredSizeWidget,
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: const Color(0xffecb22e),
                child: const Center(
                  child: Text(
                    "EXPLORE MY WORKS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                height: 100,
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
                  itemCount: 5,
                  itemBuilder: (context, index) => const ProjectTemplate(),
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
