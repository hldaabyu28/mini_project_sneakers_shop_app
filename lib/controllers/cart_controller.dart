import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';

class CartController extends ChangeNotifier {
  List<ProductModel> _cartItems = [];

  // Getter untuk mendapatkan daftar item di keranjang
  List<ProductModel> get cartItems => _cartItems;


void addToCart(ProductModel product) {
  final existingProductIndex = _cartItems.indexWhere((item) => item.id == product.id);
  if (existingProductIndex != -1) {
    // Jika produk sudah ada di keranjang, lakukan increment
    incrementQuantity(_cartItems[existingProductIndex]);
  } else {
    // Jika produk belum ada di keranjang, tambahkan ke keranjang
    _cartItems.add(product);
    notifyListeners(); // Memberi tahu listener bahwa ada perubahan pada keranjang
  }
}

  // Metode untuk menghapus produk dari keranjang berdasarkan indeks
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners(); // Memberi tahu listener bahwa ada perubahan pada keranjang
  }

  // Metode untuk menghapus semua produk dari keranjang
  void clearCart() {
    _cartItems.clear();
    notifyListeners(); // Memberi tahu listener bahwa ada perubahan pada keranjang
  }

  // Metode untuk menambahkan jumlah produk di keranjang
  void incrementQuantity(ProductModel product) {
    final index = _cartItems.indexOf(product);
    if (index != -1) {
      _cartItems[index] = product.copyWith(quantity: product.quantity + 1);
      notifyListeners();
    }
  }

  // Metode untuk mengurangi jumlah produk di keranjang
  void decrementQuantity(ProductModel product) {
    final index = _cartItems.indexOf(product);
    if (index != -1 && product.quantity > 1) {
      _cartItems[index] = product.copyWith(quantity: product.quantity - 1);
      notifyListeners();
    }
  }

  // Metode untuk mendapatkan jumlah produk di keranjang
  int getItemCount(ProductModel product) {
    final index = _cartItems.indexOf(product);
    if (index != -1) {
      return _cartItems[index].quantity;
    }
    return 0;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += double.parse(item.price) * item.quantity; // Mengalikan harga dengan jumlah
    }
    return total;
  }
}
