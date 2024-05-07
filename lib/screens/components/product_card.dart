import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/screens/widgets/detail_product.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
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
                    
                  ),
                ),
              );
            },
            child: Card(
              color: Color(0xFFDBDBEE),
              child: Stack(
                children: [
                  Hero(
                    tag: 'productImage${product.id}', // Unique tag for Hero animation
                    child: Image.asset('assets/images/shoes.png'),
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
                    fontWeight: FontWeight.bold
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IDR ${product.price}K',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF4F4FEC),
                        borderRadius: BorderRadius.circular(
                          10
                        )
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart_outlined , color: Colors.white,),
                      ),
                    )
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
