import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';

class Mobileamenitiespage extends StatefulWidget {
  const Mobileamenitiespage({super.key});

  @override
  State<Mobileamenitiespage> createState() => _MobileamenitiespageState();
}

class _MobileamenitiespageState extends State<Mobileamenitiespage> {
  int current_photo_number = 1;
  final int number_of_photos = 5;

  // Loop through the local asset array and force-cache them into RAM ahead of time
  //basically loads the photos beforehand
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Loop through your local asset array and force-cache them into RAM ahead of time
    for (int i = 1; i <= number_of_photos; i++) {
      //!CHANGE THIS DIRECTORY LATER, THIS IS NOT THE RIGHT PATH,
      //!CREATE A NEW FOLDER SPECIFICLAYY CONTIANING THE PHOTOS THE WILL BE SHOWN IN THIS PAGE
      precacheImage(AssetImage('assets/images/PHO$i.jpg'), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    // double scrHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CanvaSans(
          text: "Ammenities You’ll Love!",
          fontsize: Fontsize.mobileH1,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 30),
        Container(
          color: AppColors.softWhite,
          width: scrWidth,
          height: 300,

          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 300,
                ), // Speed of the fade transition
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: Image.asset(
                  width: scrWidth,
                  'assets/images/Ammenitites_Photos/$current_photo_number.jpg',
                  key: ValueKey<int>(current_photo_number),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (current_photo_number > 1) {
                          setState(() => current_photo_number--);
                        }
                      },
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        size: 25,
                        color: AppColors.softWhite,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (current_photo_number < number_of_photos) {
                          setState(() => current_photo_number++);
                        }
                      },
                      icon: Icon(
                        Icons.chevron_right_rounded,
                        size: 25,
                        color: AppColors.softWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Ammeneties(ammeneti_num: current_photo_number, ammeneti_reason: ""),
      ],
    );
  }
}

class Ammeneties extends StatelessWidget {
  final int ammeneti_num;
  final String ammeneti_reason;
  const Ammeneties({
    required this.ammeneti_num,
    required this.ammeneti_reason,
    super.key,
  });

  static final List<String> ammenetieHeader = [
    "Wave Pool and Man-made Beach Access",
    "Complimentary High-Speed Wi-Fi and Unlimited Netflix",
    "Complete Kitchen Facilities, including:",
    "Fresh Towels and Complimentary Guest Essentials",
    "Free Parking",
  ];
  static final List<Widget> subheading = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CanvaSans(
          text: "Our rates are ₱200 per day per person.",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
          textAlign: TextAlign.start,
        ),
        CanvaSans(
          text: "Hours of operation are from Wednesday to Monday",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
      ],
    ),
    CanvaSans(text: "", fontsize: Fontsize.mobileBody),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CanvaSans(
          text: "\u2022 Refrigerator",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Microwave",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Kettle",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 nduction Cooker",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Rice Cooker",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Dining Utensils",
          fontsize: Fontsize.mobileBody,
          fontcolor: AppColors.softblack,
        ),
      ],
    ),
    CanvaSans(
      text: "",
      fontsize: Fontsize.mobileBody,
      fontcolor: AppColors.softblack,
    ),
    CanvaSans(
      text: "In front of Home Depot",
      fontsize: Fontsize.mobileBody,
      fontcolor: AppColors.softblack,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightgrey,
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CanvaSans(
              text: ammenetieHeader[ammeneti_num - 1],
              fontsize: Fontsize.mobileH3,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 5),
            subheading[ammeneti_num - 1],
          ],
        ),
      ),
    );
  }
}
