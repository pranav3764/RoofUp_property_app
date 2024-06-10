import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PropertySlider extends StatefulWidget {
  const PropertySlider({super.key});



  @override
  State<PropertySlider> createState() => _PropertySliderState();

}

class _PropertySliderState extends State<PropertySlider> {

  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          CarouselSlider(
            items: imgList.map((item) => _buildCarouselItem(context, item)).toList(),
            options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 0.72,
                initialPage: 1,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                autoPlay: true
            ),),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\u20b9 58,00,000',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 19
                      ),),
                    Text('250 gaj (4BHK)',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),),
                    Text('Sec 32-A, Ldh',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              _toggleFavorite();
                            },
                            icon: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
                              color: _isFavorite ? Colors.pink.shade400 : Colors.black,
                            )),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.share_rounded))
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                          shadowColor: Colors.black, // Shadow color
                          elevation: 5, // Elevation
                          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: (){
                        },
                        child: Text('Contact',
                          style: TextStyle(
                            color: Colors.white,

                          ),))
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

Widget _buildCarouselItem(BuildContext context, String imageUrl) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}
