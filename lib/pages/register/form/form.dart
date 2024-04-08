import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_schemes.dart';
import '../card/card_cubit.dart';
import '../currency.page.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({
    super.key,
    required this.formKey,
    required this.accountController,
    required this.totalBalanceController,
    required this.currencyController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController accountController;
  final TextEditingController totalBalanceController;
  final TextEditingController currencyController;
  final TextEditingController descriptionController;

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  @override
  void initState() {
    widget.accountController.addListener(() {
      context.read<CardCubit>().onInputChanged(
            account: widget.accountController.text,
            totalBalance: widget.totalBalanceController.text,
          );
    });
    widget.totalBalanceController.addListener(() {
      context.read<CardCubit>().onInputChanged(
            account: widget.accountController.text,
            totalBalance: widget.totalBalanceController.text,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            controller: widget.accountController,
            decoration: const InputDecoration(
              labelText: 'Cuenta',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{1,4}')),
            ],
          ),
          const SizedBox(height: 12.0),
          TextFormField(
            controller: widget.totalBalanceController,
            decoration: const InputDecoration(
              labelText: 'Balance total',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d+[\,.]?\d{0,2}'),
              ),
            ],
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido.';
              }
              return null;
            },
          ),
          const SizedBox(height: 12.0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CurrencyPage(
                    callback: (value) {
                      widget.currencyController.text =
                          '${value.symbol} - ${value.code}';
                    },
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Selecciona una divisa'),
                const SizedBox(width: 8.0),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: lightColorScheme.primary,
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: widget.currencyController,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Divisa',
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightColorScheme.primary),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          TextFormField(
            controller: widget.descriptionController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
            ),
          ),
        ],
      ),
    );
  }
}
