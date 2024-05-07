import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _quantity = 1;
  double _totalPrice = 1500000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: ListTile(
                      title: Text('Sepatu Nike Air Max 270'),
                      subtitle: Text('Rp ${_totalPrice.toStringAsFixed(2)}'), // Update subtitle with total price
                      leading: Image.asset('assets/images/shoes.png'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => setState(() {
                              if (_quantity > 1) {
                                _quantity--;
                                _totalPrice -= 1500000; // Decrement total price for each item removed
                              }
                            }),
                            icon: Icon(Icons.remove),
                          ),
                          Text('$_quantity'),
                          IconButton(
                            onPressed: () => setState(() {
                              _quantity++;
                              _totalPrice += 1500000; // Increment total price for each item added
                            }),
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Container(
              color: Colors.transparent,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality here
                    // This function will be called when the checkout button is pressed
                    // You can navigate to the checkout page or perform any other action you want.
                  },
                  child: Text('Checkout'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
