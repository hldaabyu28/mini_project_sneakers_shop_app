import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Center(child: Image.asset('assets/images/Asset 2-8.png', width: 200, height: 200,)),
        Text(
          'Comfortable',
          style: TextStyle(
            color: Color.fromARGB(255, 113, 113, 232),
            fontSize: 22,
            fontWeight: FontWeight.normal,
            fontFamily: 'Colvetica',
          ),
        ),
         Text('Fashionable', style: TextStyle(color: Color.fromARGB(255, 113, 113, 232), fontSize: 22, fontWeight: FontWeight.normal , fontFamily: 'Colvetica'),),
         Text('Sneakers', style: TextStyle(color: Color(0xFF4F4FEC), fontSize: 22, fontWeight: FontWeight.normal , fontFamily: 'Colvetica'),),
         
         
        ],
      )
    );
  }
}