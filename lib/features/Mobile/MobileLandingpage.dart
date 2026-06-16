import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:azure_website/widgets/Mobile/Buttons.dart';
import 'package:azure_website/widgets/Snakcbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileLandingpage extends StatefulWidget {
  const MobileLandingpage({super.key});

  @override
  State<MobileLandingpage> createState() => _MobileLandingpageState();
}

class _MobileLandingpageState extends State<MobileLandingpage> {
  int currentpage = 1;

  void changepage(int newpage) {
    if (currentpage != newpage) {
      debugPrint("new page is $newpage");
      setState(() => currentpage = newpage);
    }
  }

  @override
  Widget build(BuildContext context) {
    double phWidth = MediaQuery.of(context).size.width;
    double phHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Agrandir(text: "SERENITY SUITE", spacing: 2),
        backgroundColor: AppColors.mainBG,
      ),

      drawer: Navigationdrawer(changepage: changepage),
      backgroundColor: AppColors.mainBG,
      body: SizedBox.expand(child: mobilelanding(phWidth, phHeight)),
    );
  }

  Widget mobilelanding(double phWidth, double phHeight) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [photo(phWidth, phHeight), body(phWidth, phHeight)],
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
              text: "Looking for your next vacation in Pampanga?",
              fontWeight: FontWeight.normal,
              fontsize: Fontsize.mobileBody,
            ),
            SizedBox(height: 20),
            CanvaSans(
              text:
                  "Conveniently located near the San Fernando Interchange, Serenity Suites offers the perfect escape from the everyday, providing an out-of-city resort experience while keeping you close to the vibrant attractions, dining destinations, shopping centers, and business hubs that San Fernando has to offer.",
              fontWeight: FontWeight.normal,
              fontsize: Fontsize.mobileBody,
            ),
            SizedBox(height: 20),
            CanvaSans(
              text:
                  "Whether you're planning a relaxing weekend staycation, a family getaway, or a business trip with a touch of leisure, Serenity Suites combines comfort, convenience, and modern hospitality in one exceptional destination.",
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
  final Function(int) changepage;
  const Navigationdrawer({required this.changepage, super.key});

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
                CustomNavigationTile(
                  icon: Icons.last_page,
                  text: "Landing Page",
                  onTap: () {
                    widget.changepage(1);
                    showAnimatedToast(context, "Still working on it :>");
                  },
                ),
                CustomNavigationTile(
                  icon: Icons.confirmation_number_outlined,
                  text: "Book a Reservation",
                  onTap: () {
                    widget.changepage(2);
                    showAnimatedToast(context, "Still working on it :>");
                  },
                ),
                CustomNavigationTile(
                  icon: Icons.badge_outlined,
                  text: "Meet your Host",
                  onTap: () {
                    widget.changepage(3);
                    showAnimatedToast(context, "Still working on it :>");
                  },
                ),
                CustomNavigationTile(
                  icon: Icons.payments_outlined,
                  text: "Rates Per Night",
                  onTap: () {
                    widget.changepage(4);
                    showAnimatedToast(context, "Still working on it :>");
                  },
                ),
                CustomNavigationTile(
                  icon: Icons.king_bed_outlined,
                  text: "Amenities",
                  onTap: () {
                    widget.changepage(5);
                    showAnimatedToast(context, "Still working on it :>");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomNavigationTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap; // Accepts any function action now!

  const CustomNavigationTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.softblack),
      title: CanvaSans(text: text, fontsize: Fontsize.mobileH2),
      onTap: onTap, // Assigns the passed action here
    );
  }
}
