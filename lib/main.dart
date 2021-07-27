import 'post_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'myFontFamily',
        primarySwatch: Colors.red,
      ),
      home: BloggerScreen(),
    );
  }
}

//https://www.blogger.com/blog/posts/6701914497168339121
