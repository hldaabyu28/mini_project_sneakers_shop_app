import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/views/components/product_card.dart';

import 'package:mini_project_shoes_app/views/components/image_slider.dart';
import 'package:mini_project_shoes_app/views/components/navbar.dart';
import 'package:mini_project_shoes_app/views/components/product_category.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0DEEB),
      body: ListView(
        children: [
          Navbar(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text( key: Key('special_offers'),
                'Special Offers',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                )
              ),
            )
            ),
          ImageSlider(),
          Gap(10),
          ProductCategory(),
          
          

          
          
   
        ]
      ),
  
    );
  }
}
