import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uuid;
  DatabaseService({required this.uuid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('messages');

  //create user profile
  Future createUserProfile(String email, String fullName, String phone,
      String avatar, String username, String bio) async {
    return await userCollection.doc(uuid).set({
      'email': email,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
      'bio': bio,
      'phone': phone
    });
  }

  //add message/feedback to firebase
  Future createMessage(String name, String email, String message) async {
    return await messageCollection
        .doc()
        .set({'name': name, 'email': email, 'message': message});
  }

  Stream<QuerySnapshot> get userData {
    return userCollection.snapshots();
  }

  //signed in user doc strean
  Stream<DocumentSnapshot> get currentUserData {
    return userCollection.doc(uuid).snapshots();
  }
}
