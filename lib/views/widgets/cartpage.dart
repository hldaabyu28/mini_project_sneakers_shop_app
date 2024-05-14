import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/controllers/checkout_controller.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class CartPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      backgroundColor: Color(0xFFE0DEEB),
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
                          tileColor: Color(0xFFF5F3FA),
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
                          title: Text(product.nameProduct , style: TextStyle(color: Color(0xFF4F4FEC), fontWeight: FontWeight.w800)),
                          subtitle: Text('IDR ${product.price}K', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(15), // Bentuk yang diinginkan
                                color: Color(0xFF4F4FEC),
                                child: InkWell(
                                  onTap: () {
                                    cartController.decrementQuantity(product);
                                  },
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                  child: Icon(Icons.remove, color: Colors.white,),
                                  ),
                                ),
                              ),
                              Gap(5),
                              Text(
                                '${cartController.getItemCount(product)}',
                                style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
                              ),
                              Gap(5),
                              Material(
                                borderRadius: BorderRadius.circular(15), // Bentuk yang diinginkan
                                color: Color(0xFF4F4FEC),
                                child: InkWell(
                                  onTap: () {
                                    cartController.incrementQuantity(product);
                                  },
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                  child: Icon(Icons.add, color: Colors.white,),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  QuickAlert.show(
                                    context: context , 
                                    type: QuickAlertType.confirm,
                                    title: 'Delete Form Cart',
                                    confirmBtnColor: Color(0xFF4F4FEC),
                                    text: 'Are you sure you want to delete this product from cart?',
                                    confirmBtnText: 'Delete',
                                    cancelBtnText: 'Cancel',
                                    onConfirmBtnTap: (){
                                      cartController.removeFromCart(index);
                                      Navigator.pop(context);
                                    },
                                    onCancelBtnTap: (){
                                      Navigator.pop(context);
                                    },

                                    );
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
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
                ),
              ],
            ),
    );
  }
}
