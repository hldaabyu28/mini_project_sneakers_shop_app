import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardProduct extends StatelessWidget {
  final String imagePath;

  CardProduct({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}