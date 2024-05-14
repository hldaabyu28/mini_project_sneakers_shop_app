import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_shoes_app/views/screens/onboarding.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Tambahkan logika untuk menampilkan splash screen selama beberapa detik
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/logo fix.svg',
              width: 70,
              height: 70,
            ),
            Gap(10),
            Text(
              'Script',
              style: TextStyle(
                color: Color(0xFF4F4FEC),
                fontSize: 40,
                fontFamily: 'Colvetica',
                fontWeight: FontWeight.bold,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}