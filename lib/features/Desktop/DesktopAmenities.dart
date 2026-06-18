import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';

class DesktopAmenities extends StatefulWidget {
  const DesktopAmenities({super.key});

  @override
  State<DesktopAmenities> createState() => _DesktopAmenitiesState();
}

class _DesktopAmenitiesState extends State<DesktopAmenities> {
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

    void leftameneties() {
      if (current_photo_number > 1) {
        setState(() => current_photo_number--);
      }
    }

    void rightameneties() {
      if (current_photo_number < number_of_photos) {
        setState(() => current_photo_number++);
      }
    }

    return Container(
      color: AppColors.mainBG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: scrWidth * 0.035),
            child: CanvaSans(
              text: "Ammenities You’ll Love!",
              fontsize: Fontsize.webH1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            color: AppColors.softWhite,
            width: scrWidth,
            height: 600,

            child: IntrinsicHeight(
              child: SizedBox(
                width: scrWidth,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(
                            milliseconds: 300,
                          ), // Speed of the fade transition
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,

                          child: Image.asset(
                            width: scrWidth * 0.6,
                            height: double.maxFinite,
                            'assets/images/Ammenitites_Photos/$current_photo_number.jpg',
                            key: ValueKey<int>(current_photo_number),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),

                        Expanded(
                          child: Ammeneties(
                            ammeneti_num: current_photo_number,
                            ammeneti_reason: "",
                            scrWidth: scrWidth,
                          ),
                        ),
                      ],
                    ),
                    leftbutton(leftameneties),
                    rightbutton(rightameneties),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget leftbutton(Function() changeAmenneties) {
  return Padding(
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
            changeAmenneties();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 25,
            color: AppColors.softWhite,
          ),
        ),
      ),
    ),
  );
}

Widget rightbutton(Function() changeAmenneties) {
  return Padding(
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
            changeAmenneties();
          },
          icon: Icon(
            Icons.chevron_right_rounded,
            size: 25,
            color: AppColors.softWhite,
          ),
        ),
      ),
    ),
  );
}

class Ammeneties extends StatelessWidget {
  final int ammeneti_num;
  final String ammeneti_reason;
  final double scrWidth;

  static final List<String> ammenetieHeader = [
    "Wave Pool and Man-made Beach Access",
    "Complimentary High-Speed Wi-Fi and Unlimited Netflix",
    "Complete Kitchen Facilities, including:",
    "Fresh Towels and Complimentary Guest Essentials",
    "Free Parking",
  ];
  static final List<Widget> subheading = [
    Column(
      children: [
        CanvaSans(
          text: "Our rates are ₱200 per day per person.",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "Hours of operation are from Wednesday to Monday",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
      ],
    ),
    CanvaSans(text: "", fontsize: Fontsize.webBody),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CanvaSans(
          text: "\u2022 Refrigerator",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Microwave",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Kettle",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 nduction Cooker",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Rice Cooker",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
        CanvaSans(
          text: "\u2022 Dining Utensils",
          fontsize: Fontsize.webBody,
          fontcolor: AppColors.softblack,
        ),
      ],
    ),
    CanvaSans(
      text: "",
      fontsize: Fontsize.webBody,
      fontcolor: AppColors.softblack,
    ),
    CanvaSans(
      text: "In front of Home Depot",
      fontsize: Fontsize.webBody,
      fontcolor: AppColors.softblack,
    ),
  ];
  const Ammeneties({
    required this.ammeneti_num,
    required this.ammeneti_reason,
    required this.scrWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightgrey,
      child: Padding(
        padding: EdgeInsets.all(scrWidth * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CanvaSans(
              text: ammenetieHeader[ammeneti_num - 1],
              fontsize: Fontsize.webH2,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            subheading[ammeneti_num - 1],
          ],
        ),
      ),
    );
  }
}
