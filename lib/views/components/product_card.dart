import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/views/widgets/detail_product.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF5F3FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduct(
                    productName: product.nameProduct,
                    productPrice: double.parse(product.price),
                    productImage: product.imageProduct ?? '',
                    productDescription: product.description ,
                
                  ),
                ),
              );
            },
            child: Card(
              color: Color(0xFFDBDBEE),
              child: Stack(
                children: [
                  Image.network(
                    product.imageProduct ?? '',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 150,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF4F4FEC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      product.gender,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.nameProduct,
                  style: TextStyle(
                      color: Color(0xFF4F4FEC),
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IDR ${product.price}K',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.addToCart(product);
                        QuickAlert.show(
                          context: context,
                          confirmBtnColor: Color(0xFF4F4FEC),
                          type: QuickAlertType.success,
                          text: '${product.nameProduct} added to cart successfully',
                         
                          
                        );
                        
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4F4FEC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
