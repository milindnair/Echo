import 'dart:io';

import 'package:echo/main.dart';
import 'package:echo/widgets/user_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AddPost extends StatefulWidget {
  static const routeName = '/addPost';

  const AddPost({super.key});
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? _pickedImageFile;

  void _updatePickedImage(File? pickedImage) {
    setState(() {
      _pickedImageFile = pickedImage;
    });
  }


  void _addPostHandler() async {
  if (_pickedImageFile != null) {
    // Upload the image to Firestore Storage
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString(); // Unique name for the file
      final firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);

      await storageRef.putFile(_pickedImageFile!);

      // Get the download URL for the uploaded image
      String imageUrl = await storageRef.getDownloadURL();

      // Now, you can save the imageUrl to Firestore or perform other actions
      print("Image uploaded to Firestore Storage. Download URL: $imageUrl");

      // You can save imageUrl to Firestore using cloud_firestore package
      // Example: FirebaseFirestore.instance.collection('posts').add({'imageUrl': imageUrl});
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              UserImagePicker(onImagePicked: _updatePickedImage),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _addPostHandler,
                  child: Text("Post"),
                )
              ],
            ),
          ),
        ));
  }
}
