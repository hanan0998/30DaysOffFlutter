import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          // giving text direction from left to right or right to left
          textDirection: TextDirection.rtl,
          textScaleFactor: 2.0,
        ),
      ),
    );
  }
}
