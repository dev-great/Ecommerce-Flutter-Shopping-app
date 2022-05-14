import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  static String id = 'shop';
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shop"),
      ),
    );
  }
}
