import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String? text;
  MyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString());
  }
}
