import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan/main.dart';

void main() {
  testWidgets('Testing Rendering', (WidgetTester tester) async {
    await tester.pumpWidget(const ContactApp());

    expect(find.text('Contact'), findsOneWidget);

    await tester.enterText(find.byKey(Key('nameField')), 'Delia Sepianaa');
    await tester.enterText(find.byKey(Key('phoneField')), '1234567890');

    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pick Color'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pick a File'));
    await tester.pumpAndSettle();

    expect(find.text('Delia Sepiana'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();

    expect(find.text('Delia Sepiana'), findsNothing);
  });
}
