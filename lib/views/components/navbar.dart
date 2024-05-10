
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/views/widgets/cartpage.dart';


class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Dani', style: TextStyle(color: Color(0xFF4F4FEC), fontSize: 20 ),
                ),
                Gap(6),
                Text(
                  'Script Shoes Store', style: TextStyle(color: Color(0xFF4F4FEC) , fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Row(
              children: [
               IconButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
               }, icon: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}