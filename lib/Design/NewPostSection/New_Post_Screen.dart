import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a new Post"),
      ),
      body: Container(
        child: Center(
          child: Text("You can add new post here"),
        ),
      ),
    );
  }
}