import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> _images = [
    'assets/images/banner1.png',
    'assets/images/banner2s.png',
    'assets/images/banner2s.png',
    
  ];

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 0),
      child: CarouselSlider.builder(
                itemCount: _images.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                ),
                
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Image.asset(
                    _images[index],
                  );
                }
              ),
    );
    // return Column(
    //   children: [
    //     Column(
    //       children: [
           
    //       ],
    //     ),
    //   ],
    // ); 
  }
}