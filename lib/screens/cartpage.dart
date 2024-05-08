import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartController.cartItems[index];
          return ListTile(
            title: Text(item['product_name']),
            subtitle: Text('Price: ${item['product_price']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cartController.removeItemFromCart(item['id']);
              },
            ),
          );
        },
      ),
    );
  }
}
