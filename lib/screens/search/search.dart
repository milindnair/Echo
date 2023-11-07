import 'package:flutter/material.dart';

class SearchUserPage extends StatelessWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.0, // Set the desired height for the user list
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                UserItem(
                  avatar: 'assets/user1.jpg',
                  name: 'John Doe',
                ),
                UserItem(
                  avatar: 'assets/user2.jpg',
                  name: 'Jane Smith',
                ),
                // Add more UserItems as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String avatar;
  final String name;

  const UserItem({Key? key, required this.avatar, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(height: 4.0),
          Text(name),
          const SizedBox(height: 4.0),
          ElevatedButton(
            onPressed: () {
              // Handle view button action
            },
            child: Text('View'),
          ),
        ],
      ),
    );
  }
}
