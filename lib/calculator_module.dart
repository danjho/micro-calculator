import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';

import 'presentation/calculator_page/calculator_page.dart';

class CalculatorModule extends IModule {
  @override
  Map<String, Widget Function(BuildContext context)> get pages => {
        '/calculator': (context) => const CalculatorPage(),
      };
}
