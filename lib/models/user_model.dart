class User {
  String username;
  String fullName;
  String phone;
  String email;
  String avatar;
  String bio;
  User(
      {required this.username,
      required this.fullName,
      required this.phone,
      required this.email,
      required this.avatar,
      required this.bio});
  static User fromJson(Map<String, dynamic> json) => User(
      username: json['username'],
      fullName: json['fullName'],
      phone: json['phone'],
      email: json['email'],
      avatar: json['avatar'],
      bio: json['bio']);
}
