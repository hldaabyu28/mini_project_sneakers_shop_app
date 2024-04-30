import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/svg/banner1.svg',
    'assets/svg/banner1.svg',
    'assets/svg/banner1.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 0),
        CarouselSlider.builder(
          itemCount: _images.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return SvgPicture.asset(
              _images[index],
            );
          },
        ),
      ],
    );
  }
}
