import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_shoes_app/main.dart';



void main() {
  testWidgets('Halaman harus menampilkan splash', (WidgetTester widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(MyApp());
    expect(find.byType(MyApp), findsOneWidget);
   
  });
}