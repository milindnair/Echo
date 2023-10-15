import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  ImageSource? _imageSource;

  void _pickImage() async {
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Image Source'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, ImageSource.camera);
            },
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, ImageSource.gallery);
            },
            child: const Text('Gallery'),
          ),
        ],
      ),
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _imageSource = pickedImage;
    });

    final pickedImageFile = await ImagePicker().pickImage(source: pickedImage);
    if (pickedImageFile != null) {
      setState(() {
        _pickedImageFile = File(pickedImageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _pickedImageFile != null
                  ? Image.file(
                      _pickedImageFile!,
                      fit: BoxFit.cover,
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "What do you want to echo about?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 102, 102),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text(
            'Add Image',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
