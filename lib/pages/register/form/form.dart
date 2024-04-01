import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finances/pages/register/card/card_cubit.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({
    super.key,
    required this.formKey,
    required this.accountController,
    required this.totalBalanceController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController accountController;
  final TextEditingController totalBalanceController;

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
          ),
          const SizedBox(height: 12.0),
          TextFormField(
            controller: widget.totalBalanceController,
            decoration: const InputDecoration(
              labelText: 'Balance total',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
