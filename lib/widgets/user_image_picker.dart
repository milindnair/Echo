import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File?) onImagePicked;
  
 const UserImagePicker({
    Key? key,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  final TextEditingController _textFieldController =
      TextEditingController(text: "What do you want to echo about?");
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to track focus changes
    _textFieldFocusNode.addListener(() {
      setState(() {
        // If the text field has focus, clear the default text
        if (_textFieldFocusNode.hasFocus) {
          _textFieldController.clear();
        }
      });
    });
  }

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

  final pickedImageFile = await ImagePicker().pickImage(source: pickedImage);

  if (pickedImageFile != null) {
    setState(() {
      _pickedImageFile = File(pickedImageFile.path);
    });
    widget.onImagePicked(_pickedImageFile); // Notify the parent about the picked image
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _textFieldController,
          focusNode: _textFieldFocusNode,
          style: const TextStyle(
            color: Color.fromARGB(255, 104, 102, 102),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _pickedImageFile != null
                  ? Image.file(
                      _pickedImageFile!,
                      fit: BoxFit.contain,
                    )
                  : null,
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
        // Add some additional space at the bottom
        SizedBox(height: 16.0),
      ],
    );
  }
}
