import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_shoes_app/app_route.dart';
import 'package:mini_project_shoes_app/controllers/bottom_nav_controller.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';

import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => CartController()),

      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w500
          ).fontFamily,
        ),

        
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashpage' ,
        routes: AppRoutes.routes,
      ), 
    );
  }
}
