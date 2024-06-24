import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_calculator/presentation/calculator_page/calculator_page.dart';

void main() {
  testWidgets('deve iniciar com ? ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorPage()));
    await tester.pumpAndSettle();

    final valueW = find.byKey(CalculatorPage.valueKey);

    expect(valueW, findsOneWidget);
    expect(find.text('?'), findsOneWidget);
  });

  testWidgets('deve somar 1 + 1 e exibir 2', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorPage()));
    await tester.pumpAndSettle();

    final valueW = find.byKey(CalculatorPage.valueKey);
    final number1W = find.byKey(CalculatorPage.number1Key);
    final number2W = find.byKey(CalculatorPage.number2Key);

    await tester.enterText(number1W, '1');
    await tester.enterText(number2W, '1');
    await tester.pumpAndSettle();

    final result = valueW.evaluate().single.widget as Text;
    expect(result.data, '2.0');
  });
}
