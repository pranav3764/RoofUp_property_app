import 'package:flutter/material.dart';
import 'package:property_dealer_app/Common/home_container.dart';
import 'package:property_dealer_app/Common/search_bar.dart';

class PlotPage extends StatefulWidget {
  const PlotPage({super.key});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plot',style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20
        ),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          name: 'Residential',
                          iconData: Icons.home_rounded,
                          onTap: (){
                          }),
                      HomeContainer(
                          name: 'Commercial',
                          iconData: Icons.location_city,
                          onTap: (){
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          name: 'Shop',
                          iconData: Icons.add_business_rounded,
                          onTap: (){
                          }),
                      HomeContainer(
                          name: 'Factory',
                          iconData: Icons.factory,
                          onTap: (){
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 30),
                      HomeContainer(
                          name: 'Others',
                          iconData: Icons.format_list_bulleted_outlined,
                          onTap: (){
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          CustomSearchBar()
        ],
      ),
    );
  }
}
