import 'package:aimelive_app/models/explore_tags_blog.dart';

class Blog {
  String id;
  String title;

  String image;
  String body;
  String author;
  String category;
  int status;
  List<ExploreTagsBlog> tags;
  String createdAt;
  String updatedAt;

  Blog(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.image,
      required this.body,
      required this.author,
      required this.category,
      required this.status,
      required this.tags,
      required this.updatedAt});
}
