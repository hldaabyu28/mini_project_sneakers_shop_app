import 'package:dio/dio.dart';



class ApiProduct {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://pmmpdscvqmaphuiyhpau.supabase.co/rest/v1/';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtbXBkc2N2cW1hcGh1aXlocGF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0NTA0MzEsImV4cCI6MjAzMDAyNjQzMX0.Nl1p4M7mEe7ygl6hd5HmxrGEVOU5uMUW_yFPGf1WgxM';

  Future getProducts () async {
    var baseUrl = '${_baseUrl}product?select=*';   
    final response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'prefer': 'return=representation'
        },

      ),
      
    );
    // print('print response${response.toString()}');
    return response;

  }

   Future<Response> addProduct(Map<String, dynamic> newProductData) async {
    var baseUrl = '${_baseUrl}product';
    final response = await _dio.post(
      baseUrl,
      data: newProductData,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
      ),
    );
    return response;
  }

  Future<Response> deleteProduct(int productId) async {
    var baseUrl = '${_baseUrl}product?id=eq.$productId';
    final response = await _dio.delete(
      baseUrl,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
        },
      ),
    );
    return response;
  }

  Future<Response> updateProduct(int productId, Map<String, dynamic> updatedProductData) async {
    var baseUrl = '${_baseUrl}product?id=eq.$productId';
    final response = await _dio.patch(
      baseUrl,
      data: updatedProductData,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
      ),
    );
    return response;
  }

Future searchProductsByName(String keyword) async {
  var baseUrl = '${_baseUrl}product?select=*&q=name_product.eq.$keyword';
  
  try {
    final response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'prefer': 'return=representation'
        },
      ),
    );
    print('print response${response.toString()}');

    // Periksa status respons
    if (response.statusCode == 200) {
      print('Response: ${response.data}');
      return response.data;
    } else {
      // Tangani kesalahan jika respons tidak berhasil
      print('Failed to load data, status code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Tangani kesalahan jaringan atau lainnya
    print('Error: $e');
    throw Exception('Error occurred: $e');
  }
}


}

