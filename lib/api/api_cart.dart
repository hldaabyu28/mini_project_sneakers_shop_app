import 'package:dio/dio.dart';

class CartApi {
  static const String baseUrl = 'https://pmmpdscvqmaphuiyhpau.supabase.co/rest/v1'; // Update with your API base URL
  static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtbXBkc2N2cW1hcGh1aXlocGF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0NTA0MzEsImV4cCI6MjAzMDAyNjQzMX0.Nl1p4M7mEe7ygl6hd5HmxrGEVOU5uMUW_yFPGf1WgxM'; // Replace 'your-api-key' with your actual API key

  final Dio _dio = Dio();

  // Constructor to set up Dio with the API key in headers
  CartApi() {
    _dio.options.headers['api-key'] = apiKey;
  }

  // Add item to cart
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    try {
      Response response = await _dio.post('$baseUrl/cart', data: item);
      if (response.statusCode != 200) {
        throw Exception('Failed to add item to cart');
      }
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  // Retrieve all items in the cart
  Future<List<Map<String, dynamic>>> getCartItems() async {
    try {
      Response response = await _dio.get('$baseUrl/cart');
      if (response.statusCode == 200) {
        return (response.data as List).cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to fetch cart items');
      }
    } catch (e) {
      throw Exception('Failed to fetch cart items: $e');
    }
  }

  // Remove item from cart
  Future<void> removeItemFromCart(int itemId) async {
    try {
      Response response = await _dio.delete('$baseUrl/cart/$itemId');
      if (response.statusCode != 200) {
        throw Exception('Failed to remove item from cart');
      }
    } catch (e) {
      throw Exception('Failed to remove item from cart: $e');
    }
  }
}
