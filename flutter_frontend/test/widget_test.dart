import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_frontend/main.dart';

void main() {
  testWidgets('Renders Healthcare home screen and dashboard content', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());
    // Let any initial frames settle
    await tester.pump();

    // Verify AppBar title and initial tab content render
    expect(find.text('Healthcare'), findsOneWidget);
    expect(find.text('Dashboard'), findsWidgets); // headline plus potential other occurrences
    // Basic scaffold present
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
