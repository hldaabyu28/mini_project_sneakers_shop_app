class ProductModel {
  final int id;
  final int categoryId;
  final String nameProduct;
  final String description;
  final String price; // Ubah tipe data price menjadi double
  final DateTime createdAt;
  final String? imageProduct;
  final String gender;
  int quantity = 1; // Tambahkan quantity dengan nilai default 1
 

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.nameProduct,
    required this.description,
    required this.price,
    required this.createdAt,
    this.imageProduct,
    required this.gender,
    this.quantity = 1,
   
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      nameProduct: json['name_product'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0), // Ubah tipe data dan konversi ke double
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      imageProduct: json['image_url'],
      gender: json['gender'] ?? '',
      
    );
  }


  ProductModel copyWith({int? quantity}) {
    return ProductModel(
      id: this.id,
      categoryId: this.categoryId,
      nameProduct: this.nameProduct,
      description: this.description,
      price: this.price,
      createdAt: this.createdAt,
      imageProduct: this.imageProduct,
      gender: this.gender,
      quantity: quantity ?? this.quantity, // Gunakan nilai quantity yang baru, atau nilai default
      
    );
  }

  
}
