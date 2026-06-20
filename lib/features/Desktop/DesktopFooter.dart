import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          'assets/images/backgrounds/bg1.png',
          height: 500,
          width: scrWidth,
          fit: BoxFit.cover,
        ),

        Positioned(
          left: 40,
          bottom: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  100,
                ), // High number makes it a perfect circle
                child: Image.asset(
                  'assets/images/SerenitySuitelogo.jpg',
                  width: 100, // Width and height MUST be equal
                  height: 100,
                  fit: BoxFit
                      .cover, // Ensures the square crops nicely into the circle center
                ),
              ),
              const SizedBox(width: 30),
              const Agrandir(
                text: "SERENITY SUITE",
                fontcolor: AppColors.softWhite,
                fontWeight: FontWeight.w600,
                fontsize: Fontsize.webH2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Positioned(
          right: 40,
          bottom: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: AppColors.softWhite,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: AppColors.softWhite,
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CanvaSans(
                text: "Contact us at:",
                fontsize: Fontsize.webH3,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "#0123456789",
                fontsize: Fontsize.webH3,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "info@serenitysuites.com",
                fontsize: Fontsize.webH3,
                fontcolor: AppColors.softWhite,
              ),
              const SizedBox(height: 15),
              CanvaSans(
                text: "San Fernando Interchange, San Fernando,",
                fontsize: Fontsize.webH3,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "2000 Pampanga, Philippines",
                fontsize: Fontsize.webH3,
                fontcolor: AppColors.softWhite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
