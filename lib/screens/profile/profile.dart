import 'package:echo/widgets/post.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.isMyEchosSelected, required this.isSavedEchosSelected, required this.onTapMyEchos, required this.onTapSavedEchos}) : super(key: key);

  final bool isMyEchosSelected;
  final bool isSavedEchosSelected;
  final VoidCallback onTapMyEchos;
  final VoidCallback onTapSavedEchos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 98, 99, 101),
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Parth Gala",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Bio: Software Developer\nDate of Birth: 06/07/2003",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editprofile');
                  },
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: const Column(
                    children: <Widget>[
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text("Follower"),
                    ],
                  ),
                ),
                Container(
                  child: const Column(
                    children: <Widget>[
                      Text("20", style: TextStyle(fontSize: 24)),
                      Text("Following"),
                    ],
                  ),
                ),
                Container(
                  child: const Column(
                    children: <Widget>[
                      Text("15", style: TextStyle(fontSize: 24)),
                      Text("Echo"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 0.5,
              color: const Color.fromARGB(255, 229, 64, 166),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onTapMyEchos,
                  child: Text(
                    "My Echos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: isMyEchosSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTapSavedEchos,
                  child: Text(
                    "Saved Echos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: isSavedEchosSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 0.5,
              color: const Color.fromARGB(255, 229, 64, 166),
            ),
            Container(
              child: isMyEchosSelected
                ? const PostComponent(username: "Parth Gala", text: "Aurbhaii kese ho aaplog ", imageUrl: "")
                // : dont display anything
                : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isMyEchosSelected = true;
  bool isSavedEchosSelected = false;

  void selectMyEchos() {
    setState(() {
      isMyEchosSelected = true;
      isSavedEchosSelected = false;
    });
  }

  void selectSavedEchos() {
    setState(() {
      isMyEchosSelected = false;
      isSavedEchosSelected = true;
    });
    // Add your logic for handling "Saved Echos" button click here
  }

  @override
  Widget build(BuildContext context) {
    return Profile(
      isMyEchosSelected: isMyEchosSelected,
      isSavedEchosSelected: isSavedEchosSelected,
      onTapMyEchos: selectMyEchos,
      onTapSavedEchos: selectSavedEchos,
    );
  }
}
