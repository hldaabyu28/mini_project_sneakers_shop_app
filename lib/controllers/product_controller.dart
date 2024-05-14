

import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/models/api/api_product.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';

class ProductController extends ChangeNotifier {
  final ApiProduct _apiProduct = ApiProduct();
  List<ProductModel> _products = [];
  bool _isLoaded = false;

  List<ProductModel> get products => _products;
  bool get isLoaded => _isLoaded;
  
  List<ProductModel> get allProducts => _products;

  /// Retrieves products from the API
  Future<void> getProducts() async {
    print('getProducts berhasil dijalankan $_products');

    try {
      final response = await _apiProduct.getProducts();

      print('getProducts response: $response');

      if (response != null && response.statusCode == 200) {
        _products.clear();
        final List<dynamic> responseData = response.data;
        responseData.forEach((item) {
          final product = ProductModel.fromJson(item);
          _products.add(product);
        });

        print('getProducts berhasil dimuat');
        print('Products: $_products');
      } else {
        print('Response kosong atau tidak berhasil: ${response?.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoaded = true; // Only update status if request is completed
      notifyListeners();
    }
  }


  void addProduct(Map<String, dynamic> newProductData) async {
    print("Add Produk Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _apiProduct.addProduct(newProductData);
      if (response.statusCode == 201) {
        print("Product Berhasil Ditambahkan");
        getProducts();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }

    void deleteProduct(int productId) async {
    print("Delete Produk Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _apiProduct.deleteProduct(productId);
      if (response.statusCode == 204) {
        print("Produk Berhasil Dihapus");
        getProducts();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }


  
   void updateProduct(int productId, Map<String, dynamic> updatedProductData) async {
    print("Update Produk Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _apiProduct.updateProduct(productId, updatedProductData);
      if (response.statusCode == 200) {
        print("Produk Berhasil Diperbarui");
        getProducts();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }
   
   void searchProducts(String keyword) {
  // Create a new list to store the search results
  List<ProductModel> searchResults = [];

  // If the keyword is empty, return all products
  if (keyword.isEmpty) {
    _products = allProducts;
  } else {
    // Loop through each product
    for (var product in allProducts) {
      // Check if the product name contains the search keyword
      if (product.nameProduct.toLowerCase().contains(keyword.toLowerCase())) {
        // If yes, add the product to the search results list
        searchResults.add(product);
      }
    }
    // Update _products with the search results
    _products = searchResults;
  }

  // Notify listeners that the data has been updated
  notifyListeners();
}

  /// Retrieves products by category ID from the API
 

  Future<void> searchProductsByName(String keyword) async {
    print('Search by name keyword: $keyword');
  try {
    final response = await _apiProduct.searchProductsByName(keyword);

    if (response != null && response.statusCode == 200) {
      _products.clear();
      final List<dynamic> responseData = response.data;
      responseData.forEach((item) {
        final product = ProductModel.fromJson(item);
        _products.add(product);
      });

      print('Search by name successful');
    } else {
      print('Failed to search products by name. Status code: ${response?.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    _isLoaded = true; 
    notifyListeners();
  }
}


}


  
