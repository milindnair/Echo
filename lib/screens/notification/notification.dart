import 'package:flutter/material.dart';
import 'package:echo/widgets/noti_list.dart'; // Adjust the import path based on your project structure

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    List<NotificationItem> notifications = [
      NotificationItem(avatar: 'assets/logo.png', text: 'Milind Nair liked your profile', imageUrl: 'assets/logo.png'),
      NotificationItem(avatar: 'url_to_avatar2', text: 'John Doe started following you', imageUrl: 'url_to_image2'),
      NotificationItem(avatar: 'url_to_avatar3', text: 'Jane Smith commented on your post', imageUrl: 'url_to_image3'),
      // Add more notifications as needed
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 4.0), // Add space at the top
            const TabBar(
              indicatorColor: Color(0xFFE966A0),
              tabs: [
                Tab(
                  child: Text(
                    'For You',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Following',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  NotificationList(notifications: notifications),
                  // You can add another instance of NotificationList for the 'Following' tab
                  Icon(Icons.directions_transit, size: 350),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
