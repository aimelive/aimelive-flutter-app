import 'package:aimelive_app/models/explore_tags_blog.dart';

class Blog {
  String id;
  String title;
  String date;
  String image;
  String body;
  String author;
  String category;
  List<ExploreTagsBlog> tags;

  Blog(
      {required this.id,
      required this.title,
      required this.date,
      required this.image,
      required this.body,
      required this.author,
      required this.category,
      required this.tags});
}
