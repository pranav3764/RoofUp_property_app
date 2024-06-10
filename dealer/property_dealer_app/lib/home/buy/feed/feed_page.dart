import 'package:flutter/material.dart';
import 'package:property_dealer_app/Common/SmallSearchBar.dart';
import 'package:property_dealer_app/Common/property_slider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House/Flat',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20
        ),),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SmallSearchBar(),
              SizedBox(height: 20),
              PropertySlider(),
              SizedBox(height: 20),
              PropertySlider(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
