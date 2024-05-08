class CartItem {
  int id;
  int productId;
  String productName;
  double productPrice;
  String? productImage;
  String? size;
  String? color;
  int? quantity;
  String createdAt;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    this.productImage,
    this.size,
    this.color,
    this.quantity,
    required this.createdAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['product_id'],
      productName: json['product_name'],
      productPrice: json['product_price'].toDouble(),
      productImage: json['product_image'],
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_price': productPrice,
      'product_image': productImage,
      'size': size,
      'color': color,
      'quantity': quantity,
      'created_at': createdAt,
    };
  }
}
