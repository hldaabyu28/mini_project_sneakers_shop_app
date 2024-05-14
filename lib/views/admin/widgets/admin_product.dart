import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';


class AdminProduct extends StatefulWidget {
  AdminProduct({Key? key});

  @override
  State<AdminProduct> createState() => _AdminProductState();
}
class _AdminProductState extends State<AdminProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;
  late ProductController productController;

   void _handleRadioValueChanged(String? value) {
    setState(() {
      selectedGender = value;
    });
  }

 void _editProduct(context, ProductModel product) async {
  productNameController.text = product.nameProduct;
  priceController.text = product.price.toString();
  descriptionController.text = product.description;
  imageController.text = product.imageProduct ?? ''; // Jika imageProduct null, atur nilai default
  selectedGender = product.gender;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text('Edit Product'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: productNameController..text = product.nameProduct,
            decoration: InputDecoration(
              hintText: 'Product Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter product name';
              }
            }
          ),
          TextFormField(
            controller: priceController..text = product.price.toString(),
            decoration: InputDecoration(
              hintText: 'Price IDR',
            ),
            keyboardType: TextInputType.number,
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter price';
              }
            },
          ),
          TextFormField(
            controller: descriptionController..text = product.description,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter description';
              }
            },
          ),
          TextFormField(
            controller: imageController..text = product.imageProduct!,
            decoration: InputDecoration(
              hintText: 'Image URL',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter image URL';
              }
            },
          ),
          DropdownButtonFormField<String>(
                  value: selectedGender,
                  hint: Text("Gender"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                  items: ["men's", "women's", "unisex"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select gender';
                    }
                    return null;
                  },
                ),
        ],
      ),
      
      ),
      actions: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text('Cancel')
        ),
        ElevatedButton(
          onPressed: (){
            final updatedProductData = {
              'name_product': productNameController.text,
              'price': priceController.text,
              'description': descriptionController.text,
              'image_url': imageController.text,
              'gender': selectedGender!,
            };

            Provider.of<ProductController>(context, listen: false).updateProduct(
            product.id,
            updatedProductData,);
            Navigator.pop(context);

            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Product Updated',
              text: 'Product has been updated successfully',
              confirmBtnColor: Color(0xFF4F4FEC),
            );

          }, 
          child: Text('Save', style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4F4FEC)
          )
        ),
          ],
        )
      
      
        
      ],
    ),
  );
}

  @override
  void initState() {
    super.initState();
    Provider.of<ProductController>(context, listen: false).getProducts();
   
  }



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
                  tileColor: Color(0xFFF5F3FA),
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  leading: Image.network(product.imageProduct!, fit: BoxFit.cover , width: 100, height: 100,) ,
              
                  title: Text(product.nameProduct, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4F4FEC)),),
                  subtitle: Text('IDR${product.price.toString()}K'),
                  trailing: Row (
                    mainAxisSize: MainAxisSize.min,
                
                    children: [
                      
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editProduct(context, product);
                          
                        }
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          QuickAlert.show(
                            context: context, 
                            type: QuickAlertType.confirm,
                            title: 'Delete Product',
                            text: 'Are you sure you want to delete this product?',
                            confirmBtnColor: Color(0xFF4F4FEC),
                            onConfirmBtnTap: () {
                              productController.deleteProduct(product.id!);
                              Navigator.pop(context);
                            },

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
