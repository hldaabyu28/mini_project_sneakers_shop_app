

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_shoes_app/views/screens/chat_page.dart';
import 'package:mini_project_shoes_app/views/widgets/cartpage.dart';

void main() {
  testWidgets('Halaman harus menampilkan widget chat', (WidgetTester widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(CartPage());
    expect(find.byType(AppBar), findsOneWidget);


   
  });
}
