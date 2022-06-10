class Project {
  String puid;
  String featurePhoto;
  String title;
  String description;
  String features;
  List<String> tags;
  String author;
  int status;
  DateTime createdAt;
  Project(
      {required this.puid,
      required this.featurePhoto,
      required this.title,
      required this.description,
      required this.features,
      required this.tags,
      required this.author,
      required this.status,
      required this.createdAt});
}
