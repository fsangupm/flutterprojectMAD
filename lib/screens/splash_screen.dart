import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to the Splash Screen!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
