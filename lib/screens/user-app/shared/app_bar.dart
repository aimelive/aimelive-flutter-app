import 'package:flutter/material.dart';

Widget myCustomAppBar(String title) => AppBar(
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.amber,
            backgroundImage: AssetImage("assets/photo2.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      actions: const [
        Icon(Icons.more_vert),
        SizedBox(
          width: 20,
        )
      ],
    );
