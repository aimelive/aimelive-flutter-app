import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aimelive_app/models/user_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuerySnapshot?>(context);
    if (user?.docs != null) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: user!.docs.length,
        itemBuilder: (context, index) {
          final data =
              User.fromJson(user.docs[index].data() as Map<String, dynamic>);
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data.avatar),
              ),
              title: Text(data.username),
              subtitle: Text(data.fullName),
            ),
          );
        },
      );
    }

    return Container();
  }
}
