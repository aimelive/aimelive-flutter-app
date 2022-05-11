import 'package:aimelive_app/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class BlogDetails extends StatefulWidget {
  final Blog blog;
  const BlogDetails({required this.blog});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    final assets = [
      Image(image: AssetImage('assets/${widget.blog.image}')),
    ];

    return Scaffold(
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
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
