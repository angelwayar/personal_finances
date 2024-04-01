import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finances/core/router/enum/name_page.enum.dart';
import 'package:personal_finances/pages/financialRegister/calculator.page.dart';

import '../../widgets/widgets.dart';
import 'account_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 12.0),
            const AccountSection(),
            SizedBox(
              height: 130.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(0),
                children: [
                  IconButtonWidget(
                    title: 'Register\nnew Account',
                    backgroundColor: Colors.green[100]!,
                    onTap: () {
                      context.push(NamePage.accountRegister.path());
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.green[400],
                    ),
                  ),
                  IconButtonWidget(
                    backgroundColor: Colors.green[100]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CalculatorPage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.plus_one,
                      color: Colors.green[400],
                    ),
                  ),
                  IconButtonWidget(
                    backgroundColor: Colors.green[100]!,
                    onTap: () {
                      // RegisterAccountPage
                    },
                    child: Icon(
                      Icons.plus_one,
                      color: Colors.green[400],
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
