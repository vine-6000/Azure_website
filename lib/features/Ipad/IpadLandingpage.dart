import 'package:flutter/material.dart';

class IpadLandingpage extends StatelessWidget {
  const IpadLandingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "HELLO WORLD! (In Tablet/Ipad)",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
