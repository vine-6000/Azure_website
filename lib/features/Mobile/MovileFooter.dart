import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          'assets/images/backgrounds/bg1.png',
          height: 380,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            scrWidth * 0.09,
            scrWidth * 0.13,
            scrWidth * 0.09,
            scrWidth * 0.13,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      100,
                    ), // High number makes it a perfect circle
                    child: Image.asset(
                      'assets/images/SerenitySuitelogo.jpg',
                      width: 50, // Width and height MUST be equal
                      height: 50,
                      fit: BoxFit
                          .cover, // Ensures the square crops nicely into the circle center
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Agrandir(
                    text: "SERENITY SUITE",
                    fontcolor: AppColors.softWhite,
                    fontWeight: FontWeight.w600,
                    fontsize: Fontsize.mobileH2,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  FaIcon(FontAwesomeIcons.facebook, color: AppColors.softWhite),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: AppColors.softWhite,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CanvaSans(
                text: "Contact us at:",
                fontsize: Fontsize.tabletBody,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "#0123456789",
                fontsize: Fontsize.tabletBody,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "info@serenitysuites.com",
                fontsize: Fontsize.tabletBody,
                fontcolor: AppColors.softWhite,
              ),
              const SizedBox(height: 15),
              CanvaSans(
                text: "San Fernando Interchange, San Fernando,",
                fontsize: Fontsize.tabletBody,
                fontcolor: AppColors.softWhite,
              ),
              CanvaSans(
                text: "2000 Pampanga, Philippines",
                fontsize: Fontsize.tabletBody,
                fontcolor: AppColors.softWhite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
