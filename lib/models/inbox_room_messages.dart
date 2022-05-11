class Message {
  String messageId;
  String username;
  String message;
  String avatar;
  String when;
  int length;
  Message(
      {required this.messageId,
      required this.username,
      required this.message,
      required this.avatar,
      required this.when,
      required this.length});
}
