// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vehiman/main.dart'; // Assuming the `MyApp` widget is defined in this file

void main() {
  // Run the test
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify that the initial counter value is 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Find the "add" icon and tap on it
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Wait for the app to update after tapping the icon

    // Verify that the counter value has been incremented to 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
