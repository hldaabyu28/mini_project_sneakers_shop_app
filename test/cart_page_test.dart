

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_shoes_app/views/widgets/cartpage.dart';

void main() {
  testWidgets('newProducts', (WidgetTester widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(CartPage());
    expect(find.byKey(Key('newProducts')), findsOneWidget);


   
  });
}
