import 'package:flutter/material.dart';


class IntroPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBDBEE),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Center(child: Image.asset('assets/images/Asset 1-8.png', width: 250, height: 250,)),
         
        ],
      )
    );
  }
}