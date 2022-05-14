import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static String id = 'profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
