class AppUser {
  final String uuid;

  AppUser({required this.uuid});
}

class ActiveUser {
  final String uuid;
  String username;
  String fullName;
  String phone;
  String email;
  String avatar;
  String bio;
  ActiveUser(
      {required this.uuid,
      required this.username,
      required this.fullName,
      required this.phone,
      required this.email,
      required this.avatar,
      required this.bio});

  static ActiveUser fromJsonUser(Map<String, dynamic> json, String id) =>
      ActiveUser(
          uuid: id,
          username: json['username'],
          fullName: json['fullName'],
          phone: json['phone'],
          email: json['email'],
          avatar: json['avatar'],
          bio: json['bio']);
}
