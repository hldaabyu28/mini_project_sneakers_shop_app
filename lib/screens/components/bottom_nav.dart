import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini_project_shoes_app/controllers/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);

    return Container(
      color: Color(0xFFF5F3FA),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GNav(
        selectedIndex: bottomNavBarProvider.currentIndex,
        onTabChange: (index) {
          bottomNavBarProvider.updateIndex(index);
        },
        color: Color.fromARGB(255, 148, 147, 153),
        tabBorderRadius: 20,
        activeColor: Color(0xFFDBDBEE),
        tabBackgroundGradient: LinearGradient( 
          colors: [
            Color(0xFF4F4FEC),
            Color(0xFF6A6AE0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

        ),
       
        padding: EdgeInsets.all(14),
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search_outlined,
            text: 'Search',
          ),
          GButton(
            icon: Icons.chat_outlined,
            text: 'Chat',
          ),
      
          GButton(
            icon: Icons.person_outline,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
