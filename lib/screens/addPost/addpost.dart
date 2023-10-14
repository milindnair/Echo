import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  static const routeName = '/addPost';

  const AddPost({super.key});
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Text(
          'Add Post',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
