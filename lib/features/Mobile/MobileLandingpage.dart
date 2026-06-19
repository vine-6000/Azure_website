import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:azure_website/features/Mobile/MobileAmenities.dart';
import 'package:azure_website/features/Mobile/MobileMeetHostspage.dart';
import 'package:azure_website/features/Mobile/MobileUserReviews.dart';
import 'package:azure_website/widgets/Snakcbar.dart';
import 'package:flutter/material.dart';

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
    double scrWitdth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Agrandir(text: "SERENITY SUITE", spacing: 2),
        backgroundColor: AppColors.mainBG,
      ),

      drawer: Navigationdrawer(
        changepage: changepage,
        currentpage: currentpage,
      ),
      backgroundColor: AppColors.mainBG,
      body: _buildBody(scrWitdth, scrHeight),
    );
  }

  Widget _buildBody(double width, double height) {
    switch (currentpage) {
      case 2:
        // return BookingReservationPage(width, height);
        return _buildPlaceholder("Book a Reservation");
      case 3:
        // return MeetYourHostPage(width, height);
        return Mobilemeethostspage();
      case 4:
        // return RatesPerNightPage(width, height);
        return _buildPlaceholder("Rates Per Night");
      // case 5:
      //   // return AmenitiesPage(width, height);
      //   return Mobileamenitiespage();
      default:
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              photo(width, height),
              body(width, height),
              SizedBox(height: 30),
              Mobileamenitiespage(),
              SizedBox(height: 30),
              MobileUserReviews(),
            ],
          ),
        ); // Safe fallback
    }
  }

  // A temporary clean visual placeholder until your files are made
  Widget _buildPlaceholder(String title) {
    return Center(
      child: Column(
        children: [
          CanvaSans(
            text: "$title Page",
            fontsize: Fontsize.mobileH1,
            fontWeight: FontWeight.bold,
          ),
          CanvaSans(
            text: "Ginagawa ko pa ",
            fontsize: Fontsize.mobileH1,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget photo(double scrWitdth, double scrHeight) {
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
                  text: "Experience comfort, convenience & true Serenity!",
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

  Widget body(double scrWitdth, double scrHeight) {
    return Padding(
      padding: EdgeInsets.all(scrWitdth * 0.1),
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
  final int currentpage;
  const Navigationdrawer({
    required this.changepage,
    required this.currentpage,
    super.key,
  });

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
                  icon: Icons.explore_outlined,
                  text: "Landing Page",
                  changepage: widget.changepage,
                  tileNum: 1,
                  currentpage: widget.currentpage,
                ),
                CustomNavigationTile(
                  icon: Icons.confirmation_number_outlined,
                  text: "Book a Reservation",
                  changepage: widget.changepage,
                  tileNum: 2,
                  currentpage: widget.currentpage,
                ),
                CustomNavigationTile(
                  icon: Icons.badge_outlined,
                  text: "Meet your Host",
                  changepage: widget.changepage,
                  tileNum: 3,
                  currentpage: widget.currentpage,
                ),
                CustomNavigationTile(
                  icon: Icons.payments_outlined,
                  text: "Rates Per Night",
                  changepage: widget.changepage,
                  tileNum: 4,
                  currentpage: widget.currentpage,
                ),
                // CustomNavigationTile(
                //   icon: Icons.king_bed_outlined,
                //   text: "Amenities",
                //   changepage: widget.changepage,
                //   tileNum: 5,
                //   currentpage: widget.currentpage,
                // ),
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
  final int currentpage;
  final int tileNum;
  final Function(int) changepage;

  const CustomNavigationTile({
    super.key,
    required this.icon,
    required this.text,
    required this.currentpage,
    required this.tileNum,
    required this.changepage,
  });

  @override
  Widget build(BuildContext context) {
    bool isOnPage = currentpage == tileNum;
    return ListTile(
      leading: Icon(
        icon,
        color: isOnPage ? AppColors.midnightluxury : AppColors.softblack,
      ),
      title: CanvaSans(
        text: text,
        fontsize: Fontsize.mobileH3,
        fontcolor: isOnPage ? AppColors.midnightluxury : AppColors.softblack,
      ),
      onTap: () {
        Navigator.of(context).pop();
        changepage(tileNum);
        showBeautifulSnackBar(
          context,
          message: "This page is still under construction >:(",
          type: SnackBarType.warning,
        );
      }, // Assigns the passed action here
    );
  }
}
