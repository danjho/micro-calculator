import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  static const valueKey = Key('value');
  static const number1Key = Key('number1');
  static const number2Key = Key('number2');

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double? number1;
  double? number2;
  String value = '?';

  @override
  Widget build(BuildContext context) {
    inputDecoration(String label) => InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        );

    return Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  key: CalculatorPage.valueKey,
                  value,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 64),
                TextField(
                  key: CalculatorPage.number1Key,
                  decoration: inputDecoration('First Number'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    number1 = double.tryParse(value);
                    calculate();
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  key: CalculatorPage.number2Key,
                  decoration: inputDecoration('Second Number'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    number2 = double.tryParse(value);
                    calculate();
                  },
                ),
                const SizedBox(height: 256),
              ],
            ),
          ),
        ));
  }

  void calculate() {
    if (number1 == null || number2 == null) {
      setState(() => value = '?');
      return;
    }

    final result = number1! + number2!;
    setState(() => value = '$result');
  }
}
