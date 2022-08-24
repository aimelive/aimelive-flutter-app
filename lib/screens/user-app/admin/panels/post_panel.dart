import 'package:aimelive_app/screens/blogs/components/constants.dart';
import 'package:aimelive_app/screens/user-app/admin/panels/Pages/add_post.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPanel extends StatefulWidget {
  const PostPanel({Key? key}) : super(key: key);

  @override
  State<PostPanel> createState() => _PostPanelState();
}

class _PostPanelState extends State<PostPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/beach.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const Text(
                    "Aimelive - Posts",
                    style: TextStyle(color: themeWhiteColor, fontSize: 28.0),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Today's best blogs",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: themePrimaryColor),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: blogsList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 250.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/${blogsList[index].image}'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: themeLighterGrey,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 0.75),
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              width: 250.0,
                              padding: const EdgeInsets.all(12.0),
                              decoration: const BoxDecoration(
                                color: themeWhiteColor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(12.0)),
                              ),
                              child: Text(blogsList[index].title),
                            )
                          ]);
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const AddPost());
        },
        icon: const Icon(Icons.edit),
        label: const Text("Add Post"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        backgroundColor: themePrimaryColor,
        elevation: 0.0,
      ),
    );
  }
}
