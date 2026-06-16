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
      appBar: AppBar(
        title: Agrandir(text: "SERENITY SUITE", spacing: 2),
        backgroundColor: AppColors.mainBG,
      ),
      drawer: Navigationdrawer(),
      backgroundColor: AppColors.mainBG,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [photo(phWidth, phHeight), body(phWidth, phHeight)],
          ),
        ),
      ),
    );
  }

  Widget photo(double phWidth, double phHeight) {
    return IntrinsicHeight(
      child: SizedBox(
        child: Stack(
          children: [
            Image.asset('assets/images/PHO15.jpg'),
            Padding(
              padding: EdgeInsets.only(right: 14, bottom: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: BrightSunshine(
                  text: "Hello World!",
                  fontsize: Fontsize.mobileH2,
                  fontWeight: FontWeight.w600,
                  fontcolor: AppColors.mainBG,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body(double phWidth, double phHeight) {
    return Padding(
      padding: EdgeInsets.all(phWidth * 0.1),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CanvaSans(
              text: "Azure North Condominium Pampanga",
              fontWeight: FontWeight.w800,
              fontsize: Fontsize.mobileH1,
            ),
            SizedBox(height: 20),
            CanvaSans(
              text: "Book your next vacation gateaway with us.",
              fontWeight: FontWeight.normal,
              fontsize: Fontsize.mobileCaption,
              fontcolor: AppColors.vividorange,
            ),
            SizedBox(height: 20),
            CanvaSans(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              fontWeight: FontWeight.normal,
              fontsize: Fontsize.mobileBody,
            ),
          ],
        ),
      ),
    );
  }
}


class Navigationdrawer extends StatefulWidget {
  const Navigationdrawer({super.key});

  @override
  State<Navigationdrawer> createState() => _NavigationdrawerState();
}

class _NavigationdrawerState extends State<Navigationdrawer> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      // shadowColor: Colors.white,
      backgroundColor: AppColors.mainBG,

      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(color: Colors.black38),
                ListTile(
                  leading: Icon(
                    Icons.confirmation_number_outlined,
                    color: AppColors.softblack,
                  ),
                  title: CanvaSans(
                    text: "Book a Reservation",
                    fontsize: Fontsize.mobileH2,
                  ),
                  onTap: () =>
                      showAnimatedToast(context, "Reservation pressed!"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.badge_outlined,
                    color: AppColors.softblack,
                  ),
                  title: CanvaSans(
                    text: "Meet your Host",
                    fontsize: Fontsize.mobileH2,
                  ),
                  onTap: () =>
                      showAnimatedToast(context, "Meet your Host pressed!"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.payments_outlined,
                    color: AppColors.softblack,
                  ),
                  title: CanvaSans(
                    text: "Rates Per Night",
                    fontsize: Fontsize.mobileH2,
                  ),
                  onTap: () =>
                      showAnimatedToast(context, "Rates Per Night pressed!"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.king_bed_outlined,
                    color: AppColors.softblack,
                  ),
                  title: CanvaSans(
                    text: "Amenities",
                    fontsize: Fontsize.mobileH2,
                  ),
                  onTap: () => showAnimatedToast(context, "Amenities pressed!"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

