import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../blocs/blocs.dart';
import '../../core/router/enum/name_page.enum.dart';
import '../../core/theme/color_schemes.dart';
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
    return BlocListener<AccountRegisterBloc, AccountRegisterState>(
      listener: (context, state) {
        if (state is AccountRegisterSuccess) {
          context.read<AccountBloc>().add(const AccountFetched());
        }
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: lightColorScheme.onSecondaryContainer),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state is AccountSuccess) {
                    if (state.accounts.isEmpty) {
                      return const Text(
                        'Agrega una cuenta',
                        style: TextStyle(fontSize: 18.0),
                      );
                    } else {
                      return AccountSection(accounts: state.accounts);
                    }
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 130.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: lightColorScheme.inversePrimary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: IconButtonWidget(
                      title: 'Registrar\nnueva Cuenta',
                      textColor: lightColorScheme.primary,
                      backgroundColor: Colors.green[100]!,
                      onTap: () {
                        context.push(
                          '${NamePage.home.path}/${NamePage.accountRegister.path}',
                        );
                      },
                      child: const Icon(
                        Iconsax.add5,
                        // color: Colors.green[400],
                        size: 36.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      color: lightColorScheme.inversePrimary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: IconButtonWidget(
                      title: 'Registrar\nnueva Cuenta',
                      backgroundColor: Colors.green[100]!,
                      onTap: () {
                        context.push(
                          '${NamePage.home.path}/${NamePage.journal.path}',
                        );
                      },
                      child: Icon(
                        Icons.plus_one,
                        color: Colors.green[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Últimos registros',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: lightColorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CardItemWidget();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
