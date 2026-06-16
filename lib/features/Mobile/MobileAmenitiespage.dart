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
    double phWidth = MediaQuery.of(context).size.width;
    // double phHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: SizedBox.expand(
        child: Column(
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
              color: const Color.fromARGB(255, 202, 138, 138),
              width: phWidth,

              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(
                        milliseconds: 300,
                      ), // Speed of the fade transition
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: Image.asset(
                        'assets/images/Ammenitites_Photos/$current_photo_number.jpg',
                        key: ValueKey<int>(
                          current_photo_number,
                        ), // ✨ The magic key
                        fit: BoxFit.cover, // Keeps your resort layout uniform
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: BrightSunshine(
                        text: "Placeholder Pic No $current_photo_number",
                        fontsize: Fontsize.mobileH1,
                        fontcolor: AppColors.softWhite,
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
            ),
            Ammeneties(ammeneti_num: current_photo_number, ammeneti_reason: ""),
          ],
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightgrey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CanvaSans(
              text: "Ammenetie???!??! No. $ammeneti_num",
              fontsize: Fontsize.mobileH3,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            CanvaSans(
              text:
                  "Blah blah blah.. yap yap yap... (Will be replaced with actual)",
              fontsize: Fontsize.mobileBody,
            ),
          ],
        ),
      ),
    );
  }
}
