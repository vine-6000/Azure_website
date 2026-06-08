import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:azure_website/widgets/Mobile/Buttons.dart';
import 'package:azure_website/widgets/Snakcbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileLandingpage extends StatelessWidget {
  const MobileLandingpage({super.key});

  @override
  Widget build(BuildContext context) {
    double phWidth = MediaQuery.of(context).size.width;
    double phHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/PHO1.jpg',
                width: phWidth * 0.7,
                height: phHeight * 0.3,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/PHO2.jpg',
                width: phWidth * 0.7,
                height: phHeight * 0.3,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Agrandir(
                  text: "GioLeny's Azure",
                  fontsize: Fontsize.mobileH1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Align(
                alignment: Alignment.bottomRight,
                child: NextButton(
                  onPressed: () {
                    context.goNamed("Mobile Home page");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
