import 'package:flutter/material.dart';

class PostPanel extends StatefulWidget {
  const PostPanel({Key? key}) : super(key: key);

  @override
  State<PostPanel> createState() => _PostPanelState();
}

class _PostPanelState extends State<PostPanel> {
  @override
  Widget build(BuildContext context) {
    return const Text("Hey Gang");
  }
}
