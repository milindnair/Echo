import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String username;
  final String text;
  final String imageUrl;

  const PostComponent({
    Key? key,
    required this.username,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information: Avatar and Name
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: const Text('AH'),
              ),
              const SizedBox(width: 8.0),
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Post content: Text
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),

          // Post content: Image
          Container(
            height: 200.0, // Set the desired height for the image container
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 8.0),

          // Post actions: Like, Comment, Save
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like action
                },
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // Handle comment action
                },
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
