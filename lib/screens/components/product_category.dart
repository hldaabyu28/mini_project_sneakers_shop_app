import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/screens/components/product_card.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
      if (!productController.isLoaded) {
      productController.getProducts();
    }

     final latestProducts = productController.products.reversed.toList().take(6);
  
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'New Products',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                )
              ),
            )
          ],
        ),
        GridView.builder(
          controller: ScrollController(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 12 / 18,
          ),
          shrinkWrap: true,
          itemCount: latestProducts.length,
          itemBuilder: (context, index) {
             final product = latestProducts.elementAt(index);
            return ProductCard(product);
          },
        ),
      ],
    );
  }
}


