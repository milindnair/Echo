import 'package:echo/main.dart';
import 'package:echo/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  static const routeName = '/addPost';

  const AddPost({super.key});
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: const Center(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              UserImagePicker(),
               SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: null,
                child: Text("Post"),
              )
            ],
          ),
        ));
  }
}
