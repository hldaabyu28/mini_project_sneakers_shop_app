import 'package:dio/dio.dart';

import 'package:mini_project_shoes_app/models/product_model.dart';

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

Future searchProductsByName(String keyword) async {
  var baseUrl = '${_baseUrl}product?select=*&name=cs.ilike.$keyword';
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
  print('print response${response.toString()}');
  return response;
}

}

