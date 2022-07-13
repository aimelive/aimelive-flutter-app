import 'package:aimelive_app/screens/blogs/components/constants.dart';
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
    List<Blog> suggestionQuery = blogsList.where((searchResult) {
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
                      "Few minutes ago ${blog.createdAt}",
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
