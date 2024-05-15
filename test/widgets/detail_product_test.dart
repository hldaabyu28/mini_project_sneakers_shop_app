import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_shoes_app/views/widgets/detail_product.dart';


void main() {
  testWidgets('Halaman harus menaruh widget detail product', (WidgetTester widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(DetailProduct as Widget);
    expect(find.byType(DetailProduct ), findsOneWidget);
   
  });
}