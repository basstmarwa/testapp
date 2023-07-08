// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testapp/main.dart';

void main() {
  testWidgets(' smoke test', (WidgetTester tester) async {

    const testKey = Key('myKey');

    // Build our app and trigger a frame.
    await tester.pumpWidget( const MyApp());

    // Verify that our text is Hello there.
    expect(find.text('Hello there'), findsOneWidget);

    // Verify that initial color is white
    expect((tester.firstWidget(find.byType(Container)) as Container).color,
      Colors.white,);

    // Tap on screen to change the color
    await tester.tap(find.byKey(testKey));
    await tester.pump();

    // Verify that the initial color has changed
    expect((tester.firstWidget(find.byType(Container)) as Container).color,
        isNot(Colors.white),);

  });
}
