import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/screens/components/product_card.dart'; // Import ProductCard
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late ProductController productController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(); // Initialize _searchController here
    productController = Provider.of<ProductController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Search Product"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Call search method of productController when text changes
                productController.searchProductsByName(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ProductController>(
              builder: (context, productController, _) {
                // Check if products are loaded and not empty
                if (productController.isLoaded &&
                    productController.products.isNotEmpty) {
                  return ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(productController.products[index]);
                    },
                  );
                } else {
                  // Show a message if no products found or still loading
                  return Center(
                    child: Text(
                      productController.isLoaded
                          ? "No products found"
                          : "Loading...",
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
