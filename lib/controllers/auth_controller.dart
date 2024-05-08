import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/api/api_auth.dart';

class AuthController extends ChangeNotifier {
  final ApiAuth _apiAuth = ApiAuth();
  
  bool _isLogin = false; 

  bool get isLogin => _isLogin; 

  Future<void> signup(String email, String password) async {
    try {
      await _apiAuth.signup(email, password);
     
      _isLogin = true; 
      notifyListeners();
    } catch (e) {
      print('Error during signup: $e');
     
    }
  }

  Future<void> login(String email, String password) async {
  try {
    // Attempt to login using the provided email and password
    await _apiAuth.login(email, password);
    
    // If login is successful, update the login status and notify listeners
    _isLogin = true; 
    notifyListeners();
    
  } catch (e) {
    // If an error occurs during login
    print('Error during login: $e');
    
    // Check if the error message indicates invalid credentials
    if (e.toString().contains('invalid_credentials')) {
      // Handle the case of invalid email or password here
      print('Invalid email or password');
      // You can show a snackbar or display an error message to the user
    } else {
      // Handle other types of errors here
      // You can show a generic error message to the user
      print('An unexpected error occurred');
    }
  }
}


  Future<void> logout() async {
    try {
      await _apiAuth.logout();
      _isLogin = false; 
      notifyListeners();
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
