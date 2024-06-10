import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:property_dealer_app/auth/login_page.dart';
import 'package:property_dealer_app/auth/register_page.dart';
import 'package:property_dealer_app/home/Installments/installment_calculator.dart';
import 'package:property_dealer_app/home/Installments/installment_page.dart';
import 'package:property_dealer_app/home/buy/Plot/plot_page.dart';
import 'package:property_dealer_app/home/buy/feed/feed_page.dart';
import 'package:property_dealer_app/nav_page.dart';
import 'package:property_dealer_app/splash_screen.dart';
import 'home/buy/buy_page.dart';
import 'home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property App',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/calculator': (context) => const Calculator(),
        '/nav': (context) => const NavPage(),
        '/home': (context) => const HomePage(),
        '/buy': (context) => const BuyPage(),
        '/plot': (context) => const PlotPage(),
        '/feed': (context) => const FeedPage(),
        '/installment': (context) => const InstallmentPage(),

      },
    );
  }
}