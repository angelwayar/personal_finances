import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'categories_section.dart';
import 'form/form.dart';
import 'style_card.page.dart';

class RegisterAccountPage extends StatelessWidget {
  const RegisterAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StyleCard(),
                        ),
                      ),
                      child: Container(
                        height: 190.0,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: const AccountCardWidget(
                          img: 'assets/background/card1.jpg',
                        ),
                      ),
                    ),
                    const AccountForm(),
                    const SizedBox(height: 28.0),
                    const Text('Selecciona una Categoría'),
                    const SizedBox(height: 8.0),
                    const CategoriesSection(),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save new Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
