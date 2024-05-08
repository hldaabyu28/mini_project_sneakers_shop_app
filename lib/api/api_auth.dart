import 'package:dio/dio.dart';

class ApiAuth {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://pmmpdscvqmaphuiyhpau.supabase.co'; 
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtbXBkc2N2cW1hcGh1aXlocGF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0NTA0MzEsImV4cCI6MjAzMDAyNjQzMX0.Nl1p4M7mEe7ygl6hd5HmxrGEVOU5uMUW_yFPGf1WgxM'; // Replace 'your_supabase_key' with your Supabase anonymous key

  Future<void> signup(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_apiUrl/auth/v1/signup',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'apikey': _apiKey,
          },
        ),
      );
      if (response.statusCode == 200) {
        print('Signup successful: $email');
      } else {
        print('Signup failed: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> login(String email, String password) async {
  try {
    final response = await _dio.post(
      '$_apiUrl/auth/v1/token?grant_type=password',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Content-Type': 'application/json', // Add Content-Type header
          'prefer': 'return=representation'
        },
      ),
    );
    print(response.data);
    if (response.statusCode == 200) {
      print('Login successful: $email');
    } else {
      print('Login failed: ${response.data}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> logout() async {
  try {
    // Sending a POST request using Dio package
    final response = await _dio.post(
      '$_apiUrl/auth/v1/revoke-token', 
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey', // Sending API key as a Bearer token
          'prefer': 'return=representation'
        },
      ),
    );

    // Checking response status code
    if (response.statusCode == 200 || response.statusCode == 204) {
      // If logout successful, print message
      print('Logout successful');
    } else {
      // If logout failed, print error message along with response data
      print('Logout failed: ${response.data}');
    }
  } catch (e) {
    // Catching and handling any errors that occur during the request
    print('Error: $e');
  }
}


}

