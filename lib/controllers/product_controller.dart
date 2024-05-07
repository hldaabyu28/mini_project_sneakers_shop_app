// import 'package:flutter/material.dart';
// import 'package:mini_project_shoes_app/models/products/api/api_product.dart';
// import 'package:mini_project_shoes_app/models/products/product_model.dart';
// import 'package:provider/provider.dart';
// import 'package:dio/dio.dart';

// class ProductController extends ChangeNotifier {
//   final ApiProduct _apiProduct = ApiProduct();
//   List<ProductModel>  _products = []; 
//   bool _isLoaded = false ;

//   List<ProductModel>? get products => _products; // Ganti tipe data getter menjadi List<ProductModel>
//   bool get isLoaded => _isLoaded;

//   void getProducts() async {
//     print('getProducts berhasil dijalankan');
//     _isLoaded = true;

//     try {
//       final response = await _apiProduct.getProducts();

//       print('getProducts response: $response');
       
//       // Periksa apakah response tidak null dan memiliki data
//      if (response != null) {
//        print('sebelum memasukkan $response');
//         // _products = (response as List<dynamic>).map((item) => ProductModel.fromJson(item)).toList();
//         print('getProducts berhasil dimuat');
//     print('Products: $_products');
//     notifyListeners();
//     } else {
//       print('Response kosong');
//       }

//     } catch (e) {
//       debugPrint('Error: $e');
//     } finally {
//       _isLoaded = false;
//       notifyListeners();
//     }
//   }

//   // Sisanya sama seperti sebelumnya
// }


// import 'package:flutter/material.dart';
// import 'package:mini_project_shoes_app/models/products/api/api_product.dart';
// import 'package:mini_project_shoes_app/models/products/product_model.dart';
// import 'package:dio/dio.dart';

// class ProductController extends ChangeNotifier {
//   final ApiProduct _apiProduct = ApiProduct();
//   List<ProductModel> _products = [];
//   bool _isLoaded = false ;

//   List<ProductModel> get products => _products;
//   bool get isLoaded => _isLoaded;

//   void getProducts() async {
//     print('getProducts berhasil dijalankan');
//     _isLoaded = true;

//     try {
//       final response = await _apiProduct.getProducts();

//       print('getProducts response: $response');

//       // Periksa apakah response tidak null dan memiliki data
//       if (response != null && response.data != null) {
//       // Cast the response.data to a List<dynamic> to handle potential data structures
//       final List<dynamic> responseData = response.data;

//       // Clear existing products to avoid duplicates on subsequent calls
//       _products.clear();

//       // Iterate through the response data and convert each item to a ProductModel
//       for (var item in responseData) {
//         // Assuming 'ProductModel' has a constructor that takes a Map<int, dynamic>
//         final product = ProductModel.fromJson(item as Map<int, dynamic>);
//         _products.add(product);
//       }

//       print('getProducts berhasil dimuat');
//       print('Products 85: $_products');
//         notifyListeners();
//     }
//     } catch (e) {
//       debugPrint('Error: $e');
//     } finally {
//       _isLoaded = false;
//       notifyListeners();
//     }
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mini_project_shoes_app/models/products/api/api_product.dart';
// import 'package:mini_project_shoes_app/models/products/product_model.dart';


// class ProductController extends ChangeNotifier {
//   final ApiProduct _apiProduct = ApiProduct();
//   List<ProductModel> _products = [];
//   bool _isLoaded = false;

//   List<ProductModel> get products => _products;
//   bool get isLoaded => _isLoaded;

//   void getProducts() async {
//     print('getProducts berhasil dijalankan $_products');
//     _isLoaded = true;

//     try {
//       final response = await _apiProduct.getProducts();

//       print('getProducts response: $response');

//       // Check if response is not null and if it contains data
//       if (response != null && response.statusCode == 200) {
//         // Clear existing products to avoid duplicates on subsequent calls
//         _products.clear();

//         // Parse the response data
//         final List<dynamic> responseData = response.data;
//         responseData.forEach((item) {
//           // Assuming 'ProductModel.fromJson()' method exists to parse JSON to ProductModel
//           final product = ProductModel.fromJson(item);
//           _products.add(product);
//         });

//         print('getProducts berhasil dimuat');
//         print('Products: $_products');
//         notifyListeners();
//       } else {
//         print('Response kosong atau tidak berhasil: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       _isLoaded = false;
//       notifyListeners();
//     }
    
   
    
//   }

  


//  Future<List<ProductModel>> getProductsByCategoryId(int categoryId) async {
//     try {
//       final response = await _apiProduct.getProductsByCategoryId(categoryId);

//       if (response != null && response.statusCode == 200) {
//         final List<dynamic> responseData = response.data;
//         final List<ProductModel> products = responseData
//             .map((item) => ProductModel.fromJson(item))
//             .toList();
//         return products;
//       } else {
//         print('Failed to fetch products by category ID. Status code: ${response?.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

// }

import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/models/api/api_product.dart';
import 'package:mini_project_shoes_app/models/product_model.dart';

class ProductController extends ChangeNotifier {
  final ApiProduct _apiProduct = ApiProduct();
  List<ProductModel> _products = [];
  bool _isLoaded = false;

  List<ProductModel> get products => _products;
  bool get isLoaded => _isLoaded;

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

  /// Retrieves products by category ID from the API
 

  Future<void> searchProductsByName(String keyword) async {
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
      _isLoaded = true; // Only update status if request is completed
      notifyListeners();
    }
  }

}


  
