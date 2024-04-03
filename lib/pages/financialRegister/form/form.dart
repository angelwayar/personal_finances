import 'package:flutter/material.dart';

import '../calculator.page.dart';

class FinancialForm extends StatelessWidget {
  const FinancialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Form(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Monto',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CalculatorPage(),
              ),
            );
          },
          icon: const Icon(Icons.calculate_outlined),
        ),
      ],
    );
  }
}
