import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:property_dealer_app/Common/models/model.dart';
import 'package:property_dealer_app/auth/login_page.dart';
import 'package:property_dealer_app/nav_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget checkUserStatus(BuildContext context) {
    // Simulate a delay for the splash screen
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in, navigate to NavPage
      return NavPage();
    } else {
      // User is not signed in, navigate to LoginPage
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: AnimatedSplashScreen(
          splash: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/building2.json',
                ),
                SizedBox(height: 20),
                Text(
                  'Property Advisor',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
          ),
          nextScreen: checkUserStatus(context),
          duration: 3000,
          splashIconSize: 500,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor:
              Colors.transparent, // Set transparent to let the gradient show
        ),
      ),
    );
  }
}
