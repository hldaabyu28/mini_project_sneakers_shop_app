import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/api/api_cart.dart';

class CartController extends ChangeNotifier {
  final CartApi _cartApi = CartApi();
  List<Map<String, dynamic>> _cartItems = [];

  // Getter to retrieve the current list of cart items
  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Method to add an item to the cart
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    try {
      await _cartApi.addItemToCart(item);
      _cartItems.add(item); // Add the item locally to update UI immediately
      notifyListeners();
    } catch (e) {
      print('Failed to add item to cart: $e');
      // Handle the error
    }
  }

  // Method to retrieve all items in the cart
  Future<void> fetchCartItems() async {
    try {
      _cartItems = await _cartApi.getCartItems();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch cart items: $e');
      // Handle the error
    }
  }

  // Method to remove an item from the cart
  Future<void> removeItemFromCart(int itemId) async {
    try {
      await _cartApi.removeItemFromCart(itemId);
      _cartItems.removeWhere((item) => item['id'] == itemId); // Remove the item locally to update UI immediately
      notifyListeners();
    } catch (e) {
      print('Failed to remove item from cart: $e');
      // Handle the error
    }
  }
}
