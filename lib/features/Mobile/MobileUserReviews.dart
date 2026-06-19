import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:flutter/material.dart';

class MobileUserReviews extends StatefulWidget {
  const MobileUserReviews({super.key});

  @override
  State<MobileUserReviews> createState() => _MobileUserReviewsState();
}

class _MobileUserReviewsState extends State<MobileUserReviews> {
  int comNum = 1;
  final int numOfCom = 8;

  void left() {
    if (comNum > 1) {
      setState(() => comNum--);
    }
  }

  void right() {
    if (comNum < numOfCom) {
      setState(() => comNum++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Container(
            color: AppColors.azure,
            height: 380,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Guests(comNum: comNum),
            ),
          ),
          leftbutton(left),
          rightbutton(right),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("(I made this scrollable btw)"),
            ),
          ),
        ],
      ),
    );
  }

  Widget leftbutton(Function() switchcom) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: IconButton(
          onPressed: () {
            switchcom();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 45,
            color: AppColors.softWhite,
          ),
        ),
      ),
    );
  }

  Widget rightbutton(Function() switchcom) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: () {
            switchcom();
          },
          icon: Icon(
            Icons.chevron_right_rounded,
            size: 45,
            color: AppColors.softWhite,
          ),
        ),
      ),
    );
  }
}

class Guests extends StatelessWidget {
  final int comNum;
  static const List<UserReview> guestReviews = [
    UserReview(
      userName: "Fish Umbrella Vacation",
      userComment:
          "“So happy! Tralalalalala, tralalaloo. We shall come back cause it’s slayy hoorahhhhhh.”",
      rating: 5,
    ),
    UserReview(
      userName: "Sarah Jenkins",
      userComment:
          "“Absolutely breathtaking views! The Serenity Suite lives up to its name perfectly. Highly recommend the wave pool.”",
      rating: 4,
    ),
    UserReview(
      userName: "David Cole",
      userComment:
          "“The complete kitchen facilities made our family stay incredibly convenient. Super clean and premium essentials.”",
      rating: 5,
    ),
    UserReview(
      userName: "Chasing Sunsets Travel",
      userComment:
          "“The complimentary high-speed Wi-Fi was an absolute lifesaver for my remote work sessions. 10/10 would stream here again!”",
      rating: 5,
    ),
    UserReview(
      userName: "The Wandering Foodie",
      userComment:
          "“Super love the kitchen setup! Cooked a complete boodle fight meal for the family easily. Slayy aesthetic vibes all around.”",
      rating: 4,
    ),
    UserReview(
      userName: "Marc & Lily",
      userComment:
          "“Bed sheets felt so premium and the fresh towels smelled amazing. Only downside was the Tuesday pool maintenance, but the beach access made up for it!”",
      rating: 4,
    ),
    UserReview(
      userName: "Cozy Backpacker",
      userComment:
          "“Clean as you go policy is totally fair. The host was incredibly responsive and the mailbox key pickup system was super smooth and hassle-free.”",
      rating: 5,
    ),
    UserReview(
      userName: "Disappointed Beachgoer",
      userComment:
          "“The room itself is quite beautiful and clean, but we forgot our proper swimwear and weren't allowed in the wave pool area. Strict rules!”",
      rating: 3,
    ),
  ];
  const Guests({required this.comNum, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CanvaSans(
                text: "Let our guests speak for themselves!",
                fontsize: Fontsize.mobileH1,
                fontWeight: FontWeight.w700,
                fontcolor: AppColors.softWhite,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              CanvaSans(
                text: guestReviews[comNum - 1].userComment,
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softWhite,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              CanvaSans(
                text: guestReviews[comNum - 1].userName,
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softWhite,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Rating(rating: guestReviews[comNum - 1].rating),
            ],
          ),
        ),
      ),
    );
  }
}

class Rating extends StatefulWidget {
  final int rating;
  const Rating({required this.rating, super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double starsize = 30;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          (widget.rating > 0) ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: starsize,
        ),
        Icon(
          (widget.rating > 1) ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: starsize,
        ),
        Icon(
          (widget.rating > 2) ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: starsize,
        ), // F
        Icon(
          (widget.rating > 3) ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: starsize,
        ), // F
        Icon(
          (widget.rating > 4) ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: starsize,
        ), // F
      ],
    );
  }
}

class UserReview {
  final String userName;
  final String userComment;
  final int rating; // Must be between 1 and 5

  const UserReview({
    required this.userName,
    required this.userComment,
    required this.rating,
  });
}
