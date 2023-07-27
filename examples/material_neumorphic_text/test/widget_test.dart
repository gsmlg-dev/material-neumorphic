// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:material_neumorphic_text_example/main.dart';

void main() {
  testWidgets('NeumorphicText smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Neumorphic Design'), findsOneWidget);
    expect(find.text('is'), findsOneWidget);
    expect(find.text('Simple'), findsOneWidget);
    expect(find.text('and'), findsOneWidget);
    expect(find.text('Beautiful'), findsOneWidget);
  });
}
