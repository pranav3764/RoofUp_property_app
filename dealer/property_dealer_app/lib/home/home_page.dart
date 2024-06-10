import 'package:flutter/material.dart';
import 'package:property_dealer_app/Common/appBar.dart';
import 'package:property_dealer_app/Common/home_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(name: 'Property Advisor', leading: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      onTap: () {
                        Navigator.of(context).pushNamed('/buy');
                      },
                      name: 'Buy',
                      iconData: Icons.add_home_work,
                    ),
                    HomeContainer(
                      onTap: () {},
                      name: 'Sell',
                      iconData: Icons.home_work_sharp,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      onTap: () {},
                      name: 'Rent',
                      iconData: Icons.add_home,
                    ),
                    HomeContainer(
                      onTap: () {},
                      name: 'To-Let',
                      iconData: Icons.add_home_work_outlined,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      onTap: () {
                        Navigator.of(context).pushNamed('/installment');
                      },
                      name: 'Installments',
                      iconData: Icons.calculate_rounded,
                    ),
                    HomeContainer(
                      onTap: () {},
                      name: 'Listing',
                      iconData: Icons.list_alt_rounded,
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
