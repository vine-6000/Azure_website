import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';

class Mobilemeethostspage extends StatelessWidget {
  const Mobilemeethostspage({super.key});

  @override
  Widget build(BuildContext context) {
    double phWidth = MediaQuery.of(context).size.width;
    double phHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: Padding(
        padding: EdgeInsets.only(left: phWidth * 0.075, right: phWidth * 0.075),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CanvaSans(
                text: "Meet Your Hosts",
                fontsize: Fontsize.mobileH1,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 30),
              Image.asset('assets/images/Meet_Hosts_Photos/Gio_and_Leny.jpg'),
              const SizedBox(height: 20),
              CanvaSans(
                text: "Leny and Gio",
                fontsize: Fontsize.mobileH2,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 20),
              CanvaSans(
                text:
                    "Placeholder text....    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                fontsize: Fontsize.mobileBody,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
