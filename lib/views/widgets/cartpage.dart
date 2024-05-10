import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/controllers/checkout_controller.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4FEC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: cartController.cartItems.isEmpty
          ? Center(
              child: Text('Cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartController.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: index % 2 == 0 ? Color.fromRGBO(180, 180, 250, 1) : Color.fromARGB(255, 220, 214, 250),
                          leading: SizedBox(
                            
                            width: 50,
                            height: 50,
                            child: product.imageProduct != null
                                ? Image.network(
                                    product.imageProduct!,
                                    fit: BoxFit.cover,
                                  )
                                : Placeholder(),
                          ),
                          title: Text(product.nameProduct),
                          subtitle: Text('IDR ${product.price}K'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartController.decrementQuantity(product);
                                },
                              ),
                              Text(
                                '${cartController.getItemCount(product)}',
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartController.incrementQuantity(product);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  cartController.removeFromCart(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'IDR ${cartController.totalPrice()}K',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final checkoutController = CheckoutController(phoneNumber: '6288989408911');
                      checkoutController.checkoutToWhatsApp(
                       productName: cartController.cartItems
                             .map((product) => '${product.nameProduct} (${cartController.getItemCount(product)})')
                             .join(', '),
                         quantity: cartController.cartItems.map((product) => product.quantity).reduce((a, b) => a + b),
                        productPrice: cartController.totalPrice(),
                       productImage: cartController.cartItems.map((product) => product.imageProduct ?? '').join(', '),

                       
                      );
                    },
                    child: Text('Checkout' , style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4F4FEC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                  ),
                ),
              ],
            ),
    );
  }
}
