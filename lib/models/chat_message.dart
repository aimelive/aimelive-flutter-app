import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  String messageId;
  String messageString;
  DateTime createdAt;
  String senderId;
  String receiverId;
  bool isSender;
  ChatMessage(
      {required this.messageId,
      required this.messageString,
      required this.createdAt,
      required this.senderId,
      required this.receiverId,
      required this.isSender});
}

class ChatModel {
  String messageId;
  String messageString;
  Timestamp createdAt;
  String senderId;
  String receiverId;
  ChatModel({
    required this.messageId,
    required this.messageString,
    required this.createdAt,
    required this.senderId,
    required this.receiverId,
  });
  static ChatModel fromJsonMessage(
          Map<String, dynamic> json, String messageId) =>
      ChatModel(
        messageId: messageId,
        messageString: json['messageString'],
        createdAt: json['createdAt'],
        senderId: json['senderId'],
        receiverId: json['receiverId'],
      );
}
