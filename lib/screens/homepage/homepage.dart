import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_shoes_app/screens/homepage/components/image_slider.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            expandedHeight: 150.0,
            floating: false,
            pinned: true, // Height of the expanded flexible space
            backgroundColor: Color(0xFF06648E), // Color of the app bar's shadow
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'E-Commerce App',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
             ),
            ),
            actions: [
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),

          SliverToBoxAdapter(
            
            child: ImageSlider(),
          ),


          
        ],
        
      ),
    );
  }
}
