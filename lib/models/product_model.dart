class ProductModel {
  final int id;
  final int categoryId;
  final String nameProduct;
  final String description;
  final String price; // Ubah tipe data price menjadi double
  final DateTime createdAt;
  final String? imageProduct;
  final String gender;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.nameProduct,
    required this.description,
    required this.price,
    required this.createdAt,
    this.imageProduct,
    required this.gender,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      nameProduct: json['name_product'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0), // Ubah tipe data dan konversi ke double
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      imageProduct: json['image_product'],
      gender: json['gender'] ?? '',
    );
  }
}
