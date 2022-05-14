import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  static String id = 'message';
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Message"),
      ),
    );
  }
}
