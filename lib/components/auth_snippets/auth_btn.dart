import 'package:flutter/material.dart';

class AuthBtn extends StatelessWidget {
  final String title;
  const AuthBtn({
    Key? key,
    required bool isProcessing,
    required this.title,
  })  : _isProcessing = isProcessing,
        super(key: key);

  final bool _isProcessing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFA412),
      ),
      child: Center(
        child: _isProcessing
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
