import 'package:flutter/material.dart';
import 'package:personal_finances/pages/financialRegister/categories_section.dart';

import '../../core/theme/color_schemes.dart';
import '../../widgets/widgets.dart';
import '../home/account_section.dart';
import 'form/form.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightColorScheme.onSecondaryContainer,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          const Column(
            children: [
              TabWidget(),
              AccountSection(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: FinancialForm(),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Categorias',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: lightColorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: CategoriesSection(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Registrar'),
            ),
          ),
        ],
      ),
    );
  }
}
