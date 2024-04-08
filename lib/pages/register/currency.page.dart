import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finances/core/theme/color_schemes.dart';
import '../../models/models.dart';

import '../../core/mocks/mocks.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({
    super.key,
    required this.callback,
  });

  final ValueChanged<Currency> callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: currencyMock.length,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          itemBuilder: (context, index) {
            final currency = currencyMock[index];

            return InkWell(
              onTap: () {
                callback(Currency.fromJson(currency));
                context.pop();
              },
              child: Container(
                height: 60.0,
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                decoration: BoxDecoration(
                  color: lightColorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${currency['code']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: lightColorScheme.primary,
                          ),
                        ),
                        Text(
                          '${currency['currency']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: lightColorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          color: Colors.amber[800]!,
                        ),
                        color: Colors.amber[700],
                      ),
                      child: Center(
                        child: Text(
                          '${currency['symbol']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: lightColorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
