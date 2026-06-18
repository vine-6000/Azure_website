import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';

class Desktopbookinginfo extends StatelessWidget {
  const Desktopbookinginfo({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CanvaSans(
          text: "Booking Information",
          fontsize: Fontsize.webH1,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
