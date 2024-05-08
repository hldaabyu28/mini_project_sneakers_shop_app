import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/screens/widgets/intropage1.dart';
import 'package:mini_project_shoes_app/screens/widgets/intropage2.dart';
import 'package:mini_project_shoes_app/screens/widgets/intropage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: [
         IntroPage1(),
         IntroPage2(),
         IntroPage3(),
        ],
      ),

      Container(
        alignment: Alignment(0,0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                _controller.jumpToPage(2);
              },
              child: Text ('Skip' ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F4FEC),
              
                ),),
            ),
            
            SmoothPageIndicator(controller: _controller, count: 3),
            onLastPage 
             ?  GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, '/login');
              },
              child: Text ('Done' , 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F4FEC),
                ),),
            )
             : GestureDetector(
              onTap: (){
                _controller.nextPage(
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeIn);
              },
              child: Text ('Next' , 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F4FEC),
                
                ),),
            ),
           
          ],
        )
        ),
        ],
      )
    );
  }
}