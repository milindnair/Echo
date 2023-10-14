import 'package:echo/main.dart';
import 'package:flutter/material.dart';
import 'package:echo/screens/home/home_posts.dart';
import 'package:echo/screens/notification/notification.dart';
import 'package:echo/screens/profile/profile.dart';
import 'package:echo/screens/search/search.dart';
import 'package:echo/screens/addPost/addpost.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;
    String appBarTitle = 'Home';

    switch (_currentIndex) {
      case 0:
        body = const HomeTab();
        break;
      case 1:
        body = const NotificationScreen();
        appBarTitle = 'Notifications';
        break;
      case 2:
        body = const AddPost() ;
        appBarTitle = 'Add';
        break;
      case 3:
        body = const Search();
        appBarTitle = 'Search User';
        break;
      case 4:
        body = const Profile();
        appBarTitle = 'Profile';
        break;
      default:
        body = const Center(child: Text('Unknown'));
    }

    return Scaffold(
      appBar: _currentIndex != 0
          ? AppBar(
              title: Text(appBarTitle),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            )
          : null,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.scaffoldBackgroundColor, // Set your desired background color
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Noti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search_user',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
