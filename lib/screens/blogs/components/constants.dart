import 'package:aimelive_app/models/blog_model.dart';
import 'package:aimelive_app/models/explore_tags_blog.dart';

List<Blog> blogsList = [
  Blog(
    id: "blog1",
    title: "Be your self; everyone else is taken",
    image: "gettyimages-1164885329-170667a.jpg",
    category: "Quote of the Day",
    body:
        "Teach self-denial and make its practice pleasure, and you can create for the world a destiny more sublime that ever issued from the brain of the wildest dreamer.",
    author: "John Lee",
    date: "Just now",
    tags: [
      ExploreTagsBlog(
        tagId: '4',
        tag: 'Computer Programming',
        number: Popularity(popularity: 34),
      ),
      ExploreTagsBlog(
        tagId: '5',
        tag: 'Web Full Stack',
        number: Popularity(popularity: 34),
      ),
    ],
  ),
  Blog(
    id: "blog2",
    title: "I have nothing to declare except my genius",
    image: "father.jpg",
    category: "Personal blog",
    body:
        "On January 3, 1882, the Irish poet and playwright Oscar Wilde disembarked from the ship that brought him from England to New York. It was the beginning of what would be a high-profile, 11-month-long speaking tour of America and Canada.As noted by the definitive website about that tour, Oscar Wilde in America, the ship arrived in port the night before but was held in quarantine until the next morning.That’s apparently why the date some sources attach to a famous quotation attributed to Wilde is January 2, 1882.",
    author: "Aimelive",
    date: "2 min ago",
    tags: [
      ExploreTagsBlog(
        tagId: '5',
        tag: 'Web Full Stack',
        number: Popularity(popularity: 34),
      ),
      ExploreTagsBlog(
        tagId: '6',
        tag: 'Flutter Enthusiasts',
        number: Popularity(popularity: 34),
      ),
    ],
  ),
  Blog(
      id: "blog3",
      title: "The truth is rarely pure and never simple",
      image: "software-skills.png",
      category: "Trends",
      body:
          "CONTEXT: This line is spoken by Algernon in the play The Importance of Being Earnest, written by Oscar Wilde (1895).Oscar Wilde's play is all about truth…and what happens when you don't make of habit of telling it. Jack Worthing is Cecily Cardew's guardian, which is pretty boring. So, he pretends to have a rowdy younger brother, Ernest, who's always getting into trouble. Every once in a while, Jack's got to rush to London to clean up one of Ernest's messes…and have a little fun himself.in this scene, his friend Algernon finally finds out about the little scam that Jack has been running and decides he might try something like it to woo Jack's ward Cecily. Hilarity and a whole lot of misunderstandings ensue from there, but Algernon's words turn out to be true—the truth turns out to be a whole lot more complicated than you'd actually imagine it to be.",
      author: "KAYIHURA Pio",
      date: "5 hours ago",
      tags: [
        ExploreTagsBlog(
          tagId: '3',
          tag: 'Popular',
          number: Popularity(popularity: 34),
        ),
        ExploreTagsBlog(
          tagId: '4',
          tag: 'Computer Programming',
          number: Popularity(popularity: 34),
        ),
      ]),
];
