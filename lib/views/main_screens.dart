import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/views/components/bottom_nav.dart';
import 'package:mini_project_shoes_app/controllers/bottom_nav_controller.dart';
import 'package:mini_project_shoes_app/views/screens/chat_page.dart';
import 'package:mini_project_shoes_app/views/screens/homepage.dart';
import 'package:mini_project_shoes_app/views/screens/searchpage.dart';
import 'package:mini_project_shoes_app/views/widgets/cartpage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ChatPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);

    return Scaffold(
      
      body: IndexedStack(
        index: bottomNavBarProvider.currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
