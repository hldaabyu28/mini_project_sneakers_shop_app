import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;

  
  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return Scaffold(
       backgroundColor: Color(0xFFE0DEEB),
      appBar: AppBar(
        title: Text('Add Product', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF4F4FEC),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                Gap(10),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    hintText: "Price IDR",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    // You can add more complex validation if needed
                    return null;
                  },
                ),
                Gap(10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
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
                Gap(10),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                Gap(10),
                TextFormField(
                  controller: imageController,
                  decoration: InputDecoration(
                    hintText: "Image URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter image URL';
                    }
                    // You can add more complex validation if needed
                    return null;
                  },
                ),
                Gap(10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4F4FEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                         final newProductData = {
                        'name_product': productNameController.text,
                        'price': priceController.text,
                        'gender': selectedGender,
                        'description': descriptionController.text,
                        'image_url': imageController.text
                        
                      };
                      Provider.of<ProductController>(context, listen: false).addProduct(newProductData);
                      Navigator.pop(context);

                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Product added successfully',
                        confirmBtnColor: Color(0xFF4F4FEC),
                      );
                      }
                     

                      
                    },
                    child: Text('Add Product',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
