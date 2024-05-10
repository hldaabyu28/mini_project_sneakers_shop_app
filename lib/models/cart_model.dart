import 'package:mini_project_shoes_app/models/product_model.dart';

class CartItem {
  final int id;
  final ProductModel product;
  late final int quantity;

  CartItem({required this.id, required this.product, required this.quantity, required productId});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': product.id,
      'quantity': quantity,
    };
    
  }

  static fromMap(Map<String, Object?> json) {
    
  }
}
