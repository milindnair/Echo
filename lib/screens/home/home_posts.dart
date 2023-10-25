import 'package:flutter/material.dart';
import 'package:echo/widgets/post.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Color(0xFFE966A0),
            tabs: [
              Tab(
                child: Text(
                  'Explore',
                  style:
                      TextStyle(fontSize: 16), // Adjust the font size as needed
                ),
              ),
              Tab(
                  child: Text(
                'Following',
                style:
                    TextStyle(fontSize: 16), // Adjust the font size as needed
              )),
            ],
          ),
          title: const Text('Home'),
        ),
        body: TabBarView(
          children: [
            PostComponent(
              username: 'Amanda',
              text: 'This is a post',
              imageUrl: 'assets/logo.png',
            ),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}
