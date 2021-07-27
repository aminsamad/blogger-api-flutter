import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/post_list_model.dart';

class BloggerScreen extends StatefulWidget {
  const BloggerScreen({Key key}) : super(key: key);

  @override
  _BloggerScreenState createState() => _BloggerScreenState();
}

class _BloggerScreenState extends State<BloggerScreen> {
  final String apiKey = 'AIzaSyC4nZXfJ8Cbwiy17XuML1GtMh18hudQuXw';
  //Enter your Blog Id here
  final String blogId = '6701914497168339121';

  //Function for Fetching Posts
  Future<PostList> fetchPosts() async {
    var postListUrl = Uri.https(
        "blogger.googleapis.com", "/v3/blogs/$blogId/posts/", {"key": apiKey});
    final response = await http.get(postListUrl);
    if (response.statusCode == 200) {
      return PostList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  String _length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(_length.toString()),
        title: Text("Post List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          // : null,
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.posts.length ?? 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          _length = snapshot.data.posts.length.toString();
                        });
                      },
                      title: Text(
                        snapshot.data.posts[index].title ?? "no items",
                      ),
                      subtitle: Text(
                          snapshot.data.posts[index].author.displayName ??
                              "No Auther"),
                    ),
                  );
                },
              );
          }),
    );
  }
}
