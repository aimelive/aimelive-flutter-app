class ExploreTagsBlog {
  String tagId;
  String tag;
  Popularity number;
  ExploreTagsBlog(
      {required this.tagId, required this.tag, required this.number});
}

class Popularity {
  int popularity;
  Popularity({required this.popularity});
}
