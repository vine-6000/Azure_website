import 'package:azure_website/features/Desktop/DesktopLandingpage.dart';
import 'package:azure_website/features/Ipad/IpadLandingpage.dart';
import 'package:azure_website/features/Mobile/MobileLandingpage.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  String layout = "";

  void _updateLayoutText(String newLayout) {
    //this can cause an infinite loop of setstating so check fist if the layout is not the same
    if (layout != newLayout) {
      //this is a delay to only call setstae once the page is finished building
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          layout = newLayout;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 30,
        child: Center(child: Text('Website layout => $layout')),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) {
            // Schedule the string update safely AFTER the build frame completes
            _updateLayoutText("Desktop");
            return const DesktopLandingpage();
          } else if (constraints.maxWidth > 600) {
            _updateLayoutText("Tablet/Ipad");
            return const IpadLandingpage(); // Missing 'const' added here too!
          } else {
            _updateLayoutText("Phone");
            return const MobileLandingpage();
          }
        },
      ),
    );
  }
}
