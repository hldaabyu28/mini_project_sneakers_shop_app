import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/nike1.png' , alignment: Alignment.center,),
          Text('Welcome to Script Store App',

          textAlign: TextAlign.center, 
          style: TextStyle(
            color: Colors.black, 
            fontSize: 20 , 
            height: 0), ),
        ],
      )
      
    );
  }
}