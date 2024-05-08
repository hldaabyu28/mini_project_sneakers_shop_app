import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/controllers/auth_controller.dart';
import 'package:mini_project_shoes_app/controllers/cart_controller.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  DetailProduct(
      {required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productDescription});
  

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
   
  bool _isColorSelected = false; 
  int _selectedSizeIndex = 0;

   
@override
void _toggleColorSelection(int index) {
  setState(() {
    _isColorSelected = !_isColorSelected;
  });
}

@override
void _selectSize(int index) {
  setState(() {
    _selectedSizeIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    final productcontroller = Provider.of<ProductController>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF5F3FA),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Product',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4FEC),
      ),
      body: ListView(
        children: [
        Column(
          children: [
            Gap(10),
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
                )),
              ),
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: FittedBox(
                          fit: BoxFit
                              .scaleDown, // Menyesuaikan teks ke dalam ruang yang tersedia
                          child: Text(
                            widget.productName,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Gap(6),
                      Text(
                        'IDR ${widget.productPrice}K',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Gap(6),
                      Text(
                        'Size',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Gap(6),
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
                    Gap(6),
                    Text(
                      'Color',
                      style: TextStyle(
                        color: Colors.black,
                      )
                    ),
                    Gap(6),
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
    // Add more color options here if needed
                ],
              isSelected: List.generate(3, (index) => index == _isColorSelected),
              onPressed: _toggleColorSelection,
              ),

                    ],
                  ),
                ],
              ),
            ),
            Gap(20),
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
            Gap(6),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.productDescription,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Gap(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addItemToCart({
                    'image': widget.productImage,
                    'name': widget.productName,
                    'price': widget.productPrice,
                  });
                 
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4F4FEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Gap(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lakukan aksi ketika tombol "Checkout" ditekan
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
