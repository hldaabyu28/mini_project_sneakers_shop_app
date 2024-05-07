import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/models/cart_model.dart';

class CartController extends ChangeNotifier {

  List<CartProduct> _carts = [];
  bool _isLoaded = false;

  List<CartProduct> get carts => _carts;
  bool get isLoaded => _isLoaded;

  void addToCart(CartProduct cartProduct) {
    _carts.add(cartProduct);
    notifyListeners();
  }

  


}