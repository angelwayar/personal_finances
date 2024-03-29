import 'package:flutter/material.dart';

class AccountForm extends StatelessWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Account',
            ),
          ),
          const SizedBox(height: 12.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Total balance',
            ),
          ),
        ],
      ),
    );
  }
}
