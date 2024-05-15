import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_shoes_app/views/screens/onboarding.dart';

void main() {
  testWidgets('OnBoardingPage should render correctly', (WidgetTester tester) async {
  
    await tester.pumpWidget(const MaterialApp(
      home: OnBoardingPage(),
    ));

 
    expect(find.text('Skip'), findsOneWidget);

   
    expect(find.text('Next'), findsOneWidget);

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pump();


    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pump();

  });
}
