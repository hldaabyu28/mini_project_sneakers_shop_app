// app_routes.dart
import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/views/login.dart';
import 'package:mini_project_shoes_app/views/main_screens.dart';
import 'package:mini_project_shoes_app/views/register.dart';
import 'package:mini_project_shoes_app/views/screens/homepage.dart';
import 'package:mini_project_shoes_app/views/screens/onboarding.dart';
import 'package:mini_project_shoes_app/views/screens/searchpage.dart';
import 'package:mini_project_shoes_app/views/widgets/cartpage.dart';
import 'package:mini_project_shoes_app/views/widgets/splash_page.dart';


class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/mainscreen': (context) => MainScreen(),
    '/homepage': (context) => HomePage(),
    '/searchpage': (context) => SearchPage(),
    '/cartpage': (context) => CartPage(),
    '/splashpage': (context) => SplashPage(),
    '/onboarding': (context) => OnBoardingPage(),
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
  };
}
