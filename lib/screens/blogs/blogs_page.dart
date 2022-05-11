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
          backgroundColor: const Color.fromARGB(255, 161, 161, 161),
          title: const Text('Blogs'),
          foregroundColor: Colors.white,
          elevation: 0.0,
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
              children: [
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.all(28),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Search Blog",
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        labelText: "Search Blog",
                        suffixIcon: IconButton(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            onPressed: () {},
                            icon: const Icon(Icons.search))),
                  ),
                ),
                const Text(
                  "Recent Blogs🎉🪄",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const BlogsDisplayer(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.copyright,
                      size: 14,
                    ),
                    Text(" Copyright Aimelive 2022"),
                  ],
                ),
              ],
            ),
          ),
        ));
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
