import 'package:aimelive_app/screens/blogs/components/tags_example.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'blog_details.dart';
import 'package:aimelive_app/models/blog_model.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({Key? key}) : super(key: key);

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeGrey,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            const Text('Recent Blogs🎉🪄'),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: false,
        foregroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(15),
        //   ),
        // ),
        toolbarHeight: 70,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg-app.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                child: exploreTags(),
              ),
              const Flexible(
                child: BlogsDisplayer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView exploreTags() {
    return ListView.builder(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
            decoration: BoxDecoration(
                color: themeLighterGrey,
                borderRadius: BorderRadius.circular(12)),
            child: Text(tags[index].tag),
          );
        });
  }
}

class MySearchDelegate extends SearchDelegate {
  List<Blog> suggetions = [
    Blog(
        id: "blog1",
        title: "Be your self; everyone else is taken",
        image: "gettyimages-1164885329-170667a.jpg",
        category: "Quote of the Day",
        body:
            "Teach self-denial and make its practice pleasure, and you can create for the world a destiny more sublime that ever issued from the brain of the wildest dreamer.",
        author: "John Lee",
        date: "Just now"),
    Blog(
        id: "blog2",
        title: "I have nothing to declare except my genius",
        image: "father.jpg",
        category: "Personal blog",
        body:
            "On January 3, 1882, the Irish poet and playwright Oscar Wilde disembarked from the ship that brought him from England to New York. It was the beginning of what would be a high-profile, 11-month-long speaking tour of America and Canada.As noted by the definitive website about that tour, Oscar Wilde in America, the ship arrived in port the night before but was held in quarantine until the next morning.That’s apparently why the date some sources attach to a famous quotation attributed to Wilde is January 2, 1882.",
        author: "Aimelive",
        date: "2 min ago"),
    Blog(
        id: "blog3",
        title: "The truth is rarely pure and never simple",
        image: "software-skills.png",
        category: "Trends",
        body:
            "CONTEXT: This line is spoken by Algernon in the play The Importance of Being Earnest, written by Oscar Wilde (1895).Oscar Wilde's play is all about truth…and what happens when you don't make of habit of telling it. Jack Worthing is Cecily Cardew's guardian, which is pretty boring. So, he pretends to have a rowdy younger brother, Ernest, who's always getting into trouble. Every once in a while, Jack's got to rush to London to clean up one of Ernest's messes…and have a little fun himself.in this scene, his friend Algernon finally finds out about the little scam that Jack has been running and decides he might try something like it to woo Jack's ward Cecily. Hilarity and a whole lot of misunderstandings ensue from there, but Algernon's words turn out to be true—the truth turns out to be a whole lot more complicated than you'd actually imagine it to be.",
        author: "KAYIHURA Pio",
        date: "5 hours ago"),
  ];
  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Blog> suggestionQuery = suggetions.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestionQuery.length,
        itemBuilder: (context, index) {
          final suggestion = suggestionQuery[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: themePrimaryColor,
              backgroundImage: AssetImage('assets/${suggestion.image}'),
            ),
            title: Text(suggestion.title),
            subtitle: Text(suggestion.category),
            onTap: () {
              query = suggestion.title;
              showResults(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlogDetails(blog: suggestion)));
            },
          );
        });
  }
}

class BlogsDisplayer extends StatefulWidget {
  const BlogsDisplayer({Key? key}) : super(key: key);

  @override
  State<BlogsDisplayer> createState() => _BlogsDisplayerState();
}

class _BlogsDisplayerState extends State<BlogsDisplayer> {
  List<Blog> blogsList = [
    Blog(
        id: "blog1",
        title: "Be your self; everyone else is taken",
        image: "gettyimages-1164885329-170667a.jpg",
        category: "Quote of the Day",
        body:
            "Teach self-denial and make its practice pleasure, and you can create for the world a destiny more sublime that ever issued from the brain of the wildest dreamer.",
        author: "John Lee",
        date: "Just now"),
    Blog(
        id: "blog2",
        title: "I have nothing to declare except my genius",
        image: "father.jpg",
        category: "Personal blog",
        body:
            "On January 3, 1882, the Irish poet and playwright Oscar Wilde disembarked from the ship that brought him from England to New York. It was the beginning of what would be a high-profile, 11-month-long speaking tour of America and Canada.As noted by the definitive website about that tour, Oscar Wilde in America, the ship arrived in port the night before but was held in quarantine until the next morning.That’s apparently why the date some sources attach to a famous quotation attributed to Wilde is January 2, 1882.",
        author: "Aimelive",
        date: "2 min ago"),
    Blog(
        id: "blog3",
        title: "The truth is rarely pure and never simple",
        image: "software-skills.png",
        category: "Trends",
        body:
            "CONTEXT: This line is spoken by Algernon in the play The Importance of Being Earnest, written by Oscar Wilde (1895).Oscar Wilde's play is all about truth…and what happens when you don't make of habit of telling it. Jack Worthing is Cecily Cardew's guardian, which is pretty boring. So, he pretends to have a rowdy younger brother, Ernest, who's always getting into trouble. Every once in a while, Jack's got to rush to London to clean up one of Ernest's messes…and have a little fun himself.in this scene, his friend Algernon finally finds out about the little scam that Jack has been running and decides he might try something like it to woo Jack's ward Cecily. Hilarity and a whole lot of misunderstandings ensue from there, but Algernon's words turn out to be true—the truth turns out to be a whole lot more complicated than you'd actually imagine it to be.",
        author: "KAYIHURA Pio",
        date: "5 hours ago"),
  ];
  Widget blogTemplate(blog) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlogDetails(blog: blog)));
              },
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Hero(
                          tag: "${blog.id}",
                          child: Image.asset("assets/${blog.image}"))),
                  Text(
                    blog.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.insert_comment,
                      color: Colors.blue[300],
                      size: 14,
                    ),
                    Text(
                      ' 2 ',
                      style: TextStyle(fontSize: 14, color: Colors.blue[300]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: Colors.grey[400],
                      size: 14,
                    ),
                    Text(
                      ' ${blog.date}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
                const Text(
                  "Read More",
                  style: TextStyle(fontSize: 14, color: Color(0xffecb22e)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: blogsList.map((blog) => blogTemplate(blog)).toList(),
    );
  }
}
