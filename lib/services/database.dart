import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uuid;
  DatabaseService({required this.uuid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('messages');

  final CollectionReference chatMessageCollection =
      FirebaseFirestore.instance.collection('chat_messages');

  //create user profile
  Future createUserProfile(String email, String fullName, String phone,
      String avatar, String username, String bio, String role) async {
    return await userCollection.doc(uuid).set({
      'email': email,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
      'bio': bio,
      'phone': phone,
      'role': role
    });
  }

  //add message/feedback to firebase
  Future createMessage(String name, String email, String message) async {
    return await messageCollection
        .doc()
        .set({'name': name, 'email': email, 'message': message});
  }

  Future createChatMessage(
      String messageString, DateTime createdAt, String receiverId) async {
    return await chatMessageCollection.doc().set({
      'messageString': messageString,
      'receiverId': receiverId,
      'senderId': uuid,
      'createdAt': createdAt
    });
  }

//getting users
  Stream<QuerySnapshot> get userData {
    return userCollection.snapshots();
  }

//getting chat messages
  Stream<QuerySnapshot> chatMessage(String? sender, String? receiver) {
    return chatMessageCollection.snapshots();
  }

  //signed in user doc strean
  Stream<DocumentSnapshot> get currentUserData {
    return userCollection.doc(uuid).snapshots();
  }
}
