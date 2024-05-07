import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  final String productName;
  final double productPrice;
  

  DetailProduct({required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    final productcontroller = Provider.of<ProductController>(context);
    String selectedSize = 'S'; // Ukuran default
    String selectedColor = 'Red'; // Warna default

    return Scaffold(
      backgroundColor: Color(0xFFF5F3FA),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Detail Product' ,style: TextStyle(color: Colors.white),),

        centerTitle: true,
        backgroundColor: Color(0xFF4F4FEC),
      ),
      body: Column(
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
                child: Image.asset(
                  'assets/images/shoes.png',
                  fit: BoxFit.cover,
                ),
              ),
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
                      child: Text(
                        productName,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        maxLines: 2,
                      ),
                    ),
                    Gap(6),
                    Text(
                      'Rp ${productPrice.toDouble()}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Gap(6),
                    DropdownButton<String>(
                      value: selectedSize,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          selectedSize = newValue;
                        }
                      },
                      items: <String>['S', 'M', 'L', 'XL']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Gap(6),
                    DropdownButton<String>(
                      value: selectedColor,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          selectedColor = newValue;
                        }
                      },
                      items: <String>['Red', 'Blue', 'Green', 'Yellow']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(20),
          Expanded(
            child: Container(
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
                        'Ini adalah deskripsi produk. Deskripsi panjang produk dapat ditampilkan di sini. Anda dapat menambahkan sebanyak mungkin detail yang Anda inginkan.',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Gap(20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                       
                      },
                      child: Text('Add to Cart' , style: TextStyle(color: Colors.white),),
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
                      child: Text('Checkout' , style: TextStyle(color: Colors.white),),
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
          )
        ],
      ),
    );
  }
}
