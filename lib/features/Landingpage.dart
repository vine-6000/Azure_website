import 'package:azure_website/features/Desktop/DesktopLandingpage.dart';
import 'package:azure_website/features/Mobile/MobileLandingpage.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) {
            return const DesktopLandingpage(); // From desktop/ folder
          }
          // else if (constraints.maxWidth > 600) {
          //  // return const HomeIpadView(); // From ipad/ folder
          // }
          else {
            return const MobileLandingpage(); // From mobile/ folder
          }
        },
      ),
    );
  }
}
