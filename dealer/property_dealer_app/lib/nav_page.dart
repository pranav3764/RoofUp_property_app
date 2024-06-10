import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:property_dealer_app/home/home_page.dart';
import 'package:property_dealer_app/more/more_page.dart';
import 'package:property_dealer_app/notifications/notifications_page.dart';
import 'package:property_dealer_app/saved/saved_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int index = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomePage(),
      Saved(),
      Notifications(),
      More(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          rippleColor: Colors.blue.shade50, // tab button ripple color when pressed
          hoverColor: Colors.blue.shade300, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 25,
          curve: Curves.fastOutSlowIn, // tab animation curves
          duration: Duration(milliseconds: 300), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.blue.shade800, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Colors.blue.shade50, // selected tab background color
          padding: EdgeInsets.all(12), // navigation bar padding
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_outline_rounded,
              text: 'Saved',
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            GButton(
              icon: Icons.more_horiz,
              text: 'More',
            )
          ],
          selectedIndex: index,
          onTabChange: (int newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
      ),
    );
  }
}