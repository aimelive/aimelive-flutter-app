import 'package:aimelive_app/models/blog_model.dart';
import 'package:aimelive_app/models/explore_tags_blog.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class BlogDetails extends StatefulWidget {
  final Blog blog;
  const BlogDetails({required this.blog});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final assets = [
      Image(image: AssetImage('assets/${widget.blog.image}')),
    ];
    Widget tagsWidget(List<ExploreTagsBlog> tags) {
      return Row(
        children: tags
            .map(
              (tag) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.7, horizontal: 6.0),
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                    color: themePrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  tag.tag,
                  style: const TextStyle(color: themeWhiteColor, fontSize: 11),
                ),
              ),
            )
            .toList(),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog"),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.blog.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " ${widget.blog.category}",
                      style: const TextStyle(
                          color: Color(0xffecb22e),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.history,
                          size: 15,
                          color: Colors.grey,
                        ),
                        Text(
                          " ${widget.blog.date}   ",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onDoubleTap: (() {
                    SwipeImageGallery(
                      context: context,
                      children: assets,
                    ).show();
                  }),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Hero(
                          tag: widget.blog.id,
                          child: Image.asset("assets/${widget.blog.image}"))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.blog.body,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10.0),
                tagsWidget(widget.blog.tags),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 12, 0, 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Text(
                        " Written by ${widget.blog.author}",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          //animatedIcon: AnimatedIcons.menu_close,
          icon: Icons.share,
          backgroundColor: const Color(0xffecb22e),
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 12,
          spaceBetweenChildren: 12,
          //closeManually: true,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.copy),
                label: 'Clip board',
                onTap: () {}),
            SpeedDialChild(
                child: const Icon(Icons.mail),
                label: 'Mail',
                backgroundColor: Colors.blue.shade200,
                foregroundColor: Colors.white),
            SpeedDialChild(
                child: const Icon(Icons.facebook),
                label: 'Facebook',
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white),
            SpeedDialChild(
                child: const Icon(Icons.whatsapp),
                label: 'WhatsApp',
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white),
            SpeedDialChild(
                child: const Icon(Icons.snapchat),
                label: 'Snapchat',
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
