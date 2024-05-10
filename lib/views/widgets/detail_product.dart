import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/controllers/checkout_controller.dart';
import 'package:provider/provider.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';


class DetailProduct extends StatefulWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  DetailProduct({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDescription,
  });

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool _isColorSelected = false;
  int _selectedSizeIndex = 0;

  void _toggleColorSelection(int index) {
    setState(() {
      _isColorSelected = !_isColorSelected;
    });
  }

  void _selectSize(int index) {
    setState(() {
      _selectedSizeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product' , style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4FEC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFDBDBEE),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Center(
                    child: Image.network(
                      widget.productImage,
                      width: 500,
                      height: 500,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(
                        color: Color(0xFF4F4FEC),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'IDR ${widget.productPrice}K',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      ToggleButtons(
                        children: <Widget>[
                          Text('40'),
                          Text('41'),
                          Text('42'),
                          Text('43'),
                        ],
                        isSelected: List.generate(4, (index) => index == _selectedSizeIndex),
                        onPressed: _selectSize,
                      ),
                      Text(
                        'Color',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      ToggleButtons(
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 255, 228, 226),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 231, 170, 255),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 57, 150, 250),
                            ),
                          ),
                        ],
                        isSelected: List.generate(3, (index) => index == _isColorSelected),
                        onPressed: _toggleColorSelection,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFDBDBEE),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          widget.productDescription,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final checkoutController = CheckoutController(phoneNumber: '6288989408911');
                          checkoutController.checkoutToWhatsApp(
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productImage: widget.productImage,
                            quantity: 1,
                          );
                        },
                        child: Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 108, 108, 209),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


