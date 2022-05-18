import 'package:flutter/material.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const Center(
        child: ClipRRect(
          child: Image(
            height: 25,
            width: 25,
            image: AssetImage("assets/icons/1534129544.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
