import 'package:azure_website/core/constants/Colors.dart';
import 'package:azure_website/core/constants/Fonts.dart';
import 'package:azure_website/core/constants/Fontsizes.dart';
import 'package:azure_website/widgets/Snakcbar.dart';
import 'package:flutter/material.dart';

class Mobilebookinginfo extends StatelessWidget {
  const Mobilebookinginfo({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(scrWidth * 0.1),
          child: const CanvaSans(
            text: "Booking Information",
            fontsize: Fontsize.mobileH1,
            fontWeight: FontWeight.w700,
            fontcolor: AppColors.softblack,
          ),
        ),
        const SizedBox(height: 15),
        Image.asset(width: scrWidth, 'assets/images/PHO22.jpg'),
        Padding(
          padding: EdgeInsets.only(left: scrWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const BookingHoursSection(),
              const SizedBox(height: 20),
              const CanvaSans(
                text: "Key pick up via mailbox",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              const SizedBox(height: 40),
              const ImportantNotesSection(),
              const SizedBox(height: 40),
              const RatesSection(),
              const SizedBox(height: 30),
              const LuxuryButton(text: "Book Now!"),
            ],
          ),
        ),
      ],
    );
  }
}

class BookingHoursSection extends StatelessWidget {
  const BookingHoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CanvaSans(
            text: "Hours",
            fontsize: Fontsize.mobileH2,
            fontcolor: AppColors.vividorange,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CanvaSans(
                    text: "Check In",
                    fontsize: Fontsize.mobileH3,
                    fontcolor: AppColors.softblack,
                  ),
                  CanvaSans(
                    text: "Check Out",
                    fontsize: Fontsize.mobileH3,
                    fontcolor: AppColors.softblack,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CanvaSans(
                    text: "2 PM",
                    fontsize: Fontsize.mobileH3,
                    fontcolor: AppColors.softblack,
                  ),
                  CanvaSans(
                    text: "12 Noon",
                    fontsize: Fontsize.mobileH3,
                    fontcolor: AppColors.softblack,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImportantNotesSection extends StatelessWidget {
  const ImportantNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CanvaSans(
          text: "Important Notes",
          fontsize: Fontsize.mobileH2,
          fontcolor: AppColors.vividorange,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CanvaSans(
                text: "\u2022 Pool is closed every Tuesday for maintenance",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              CanvaSans(
                text: "\u2022 Proper swimwear required",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              CanvaSans(
                text: "\u2022 Non-smoking unit",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              CanvaSans(
                text: "\u2022 Light cooking only",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              CanvaSans(
                text: "\u2022 Clean as you go",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
              CanvaSans(
                text: "\u2022 Security deposit: ₱1,000 (refundable)",
                fontsize: Fontsize.mobileH3,
                fontcolor: AppColors.softblack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatesSection extends StatelessWidget {
  const RatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 630,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CanvaSans(
            text: "Rates",
            fontsize: Fontsize.mobileH2,
            fontcolor: AppColors.vividorange,
          ),
          SizedBox(height: 7),
          CanvaSans(
            text: "Weekdays:",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),
          SizedBox(height: 5),
          CanvaSans(
            text: "₱2,500 (2 people)",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),
          CanvaSans(
            text: "Weekends:",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),
          SizedBox(height: 5),
          CanvaSans(
            text: "₱2,800 (2 people)",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),
          CanvaSans(
            text: "Additional Person:",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),

          CanvaSans(
            text: "₱300/head (max. of 4 people)",
            fontsize: Fontsize.mobileH3,
            fontcolor: AppColors.softblack,
          ),
        ],
      ),
    );
  }
}

class LuxuryButton extends StatelessWidget {
  final String text;
  // final VoidCallback onPressed;

  const LuxuryButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showCustomSnackBar(context, "User clicked Book now!");
      },
      style: OutlinedButton.styleFrom(
        // 1. Match the dark brown/charcoal text & border color from your image
        side: const BorderSide(color: Color(0xFF4A3E3D), width: 1.0),
        foregroundColor: const Color(0xFF4A3E3D),

        // 2. Button shape (rectangular with tiny rounded corners for smoothness)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),

        // 3. internal breathing room (padding) to match the aspect ratio
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing:
              1.5, // Subtle letter spacing to match the luxury aesthetic
        ),
      ),
    );
  }
}
