import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationList({Key? key, required this.notifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationItemWidget(notification: notifications[index]);
      },
    );
  }
}

class NotificationItem {
  final String avatar;
  final String text;
  final String imageUrl;

  NotificationItem(
      {required this.avatar, required this.text, required this.imageUrl});
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem notification;

  const NotificationItemWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.text,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
