import 'package:url_launcher/url_launcher.dart';

class CheckoutController {
  final String phoneNumber;

  CheckoutController({required this.phoneNumber});

  void checkoutToWhatsApp({
    required String productName,
    required double productPrice,
    required String productImage,
    required int quantity,
  }) async {
    String message =
        'Hello, I would like to place an order for the following item:\n\n'
        '$productName\n'
        'Total Price: IDR ${productPrice.toStringAsFixed(2)}K\n'
        'Quantity: $quantity\n\n'
        'Please let me know the details for payment and delivery. Thank you!';
    String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';

    
      launchUrl(Uri.parse(url));
  }
}

