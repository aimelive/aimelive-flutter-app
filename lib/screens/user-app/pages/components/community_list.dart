import 'package:aimelive_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';
import 'package:aimelive_app/screens/user-app/pages/inbox.dart';
import 'package:aimelive_app/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CommunityList extends StatefulWidget {
  const CommunityList({Key? key}) : super(key: key);

  @override
  State<CommunityList> createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  Widget userCard(user, userId) {
    final data = User.fromJson(user.data() as Map<String, dynamic>, userId);
    final assets = [Image(image: NetworkImage(data.avatar))];
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    SwipeImageGallery(
                      context: context,
                      children: assets,
                    ).show();
                  }),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatar),
                    radius: 26,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.fullName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.bio,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InboxChats(user: data)));
              },
              icon: const Icon(
                Icons.add_comment_sharp,
                color: Color(0xffecb22e),
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuerySnapshot?>(context);
    if (user?.docs != null) {
      return Column(
        children: user!.docs
            .map((userData) => userCard(userData, userData.id))
            .toList(),
      );
    } else {
      return const Loading();
    }
  }
}
