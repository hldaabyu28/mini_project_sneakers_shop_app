import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';


class AdminProduct extends StatefulWidget {
  AdminProduct({Key? key});

  @override
  State<AdminProduct> createState() => _AdminProductState();
}
class _AdminProductState extends State<AdminProduct> {
  late ProductController productController;


  @override
  Widget build(BuildContext context) {
    productController = Provider.of<ProductController>(context, listen: false);

    return Consumer<ProductController>(
      builder: (context, productController, _) {
        if (productController.isLoaded && productController.products.isNotEmpty) {
          return Column(
            children: productController.products.map((product) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                 leading: Container(
                
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey,
                   ),
                   child: SizedBox(
                     width: 80,
                     height: 80,
                     child: Center(
                       child: Image.network(product.imageProduct!, fit: BoxFit.cover),
                     ),
                   ),
                 ),
                  title: Text(product.nameProduct),
                  subtitle: Text(product.price.toString()),
                  trailing: Row (
                    mainAxisSize: MainAxisSize.min,
                
                    children: [
                      
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          
                        }
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context, 
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text('Delete Product'),
                              content: Text('Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(
                                  onPressed: () { 
                                    Navigator.pop(context);
                                   },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    productController.deleteProduct(product.id!);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Delete', style: TextStyle(color: Colors.red),),
                                  
                                  
                                )
                              ]
                              )
                            );
                          
                        }
                      )
                    ],)
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: Text(
              productController.isLoaded ? "No products found" : "Loading...",
            ),
          );
        }
      },
    );
  }
}
