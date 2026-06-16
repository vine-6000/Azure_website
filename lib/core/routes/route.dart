//main Routers
import 'package:azure_website/features/Landingpage.dart';

//Phone Routes
import 'package:azure_website/features/Mobile/MobileAmenitiespage.dart';

//Tablet Routes

//Web Routes

//Others
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  initialLocation: "Landingpage",
  routes: <RouteBase>[
    //main Routers
    GoRoute(
      name: "Landingpage",
      path: "/Landingpage",
      builder: (context, state) => const Landingpage(),
    ),
    //Phone Routes
    GoRoute(
      name: "Amenitiesphone",
      path: "/Amenitiesphone",
      builder: (context, state) => const Mobileamenitiespage(),
    ),
    //Tablet Routes

    //Web Routes
  ],
  errorBuilder: (context, state) => Scaffold(
    backgroundColor: Colors.grey.shade100,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 96,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 24),
            const Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const Text(
              'Error 404 (I think...)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'The page you’re looking for doesn’t exist\nsorry for the inconvenience.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // Safely redirect back to your main business home page
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go back home'),
            ),
          ],
        ),
      ),
    ),
  ),
);
