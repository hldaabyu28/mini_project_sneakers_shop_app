import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class IntroPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Center(child: Image.asset('assets/images/Asset 1-8.png', width: 250, height: 250,)),
         Gap(10),
         Text('Get Your Sneakers', style: TextStyle(color: Color(0xFF4F4FEC), fontSize: 20, fontWeight: FontWeight.bold),),
         
        ],
      )
    );
  }
}