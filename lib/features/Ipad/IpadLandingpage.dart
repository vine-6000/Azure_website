import 'package:flutter/material.dart';

class IpadLandingpage extends StatelessWidget {
  const IpadLandingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "If you can read this message",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "You are in a device that is not yet supported by the website",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "We apologise for the inconvinience",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
