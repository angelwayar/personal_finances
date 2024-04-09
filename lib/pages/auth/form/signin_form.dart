import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../widgets/widgets.dart';

class SignForm extends StatelessWidget {
  const SignForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if ((value == null) || (value.isEmpty)) {
                return 'Campo requerido.';
              } else if (!regexEmailStrturcture.hasMatch(value)) {
                return 'Insertar un correo valido.';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'correo electronico',
            ),
          ),
          const SizedBox(height: 24.0),
          TextFormFieldPassword(
            labelText: 'Confirmar contraseña',
            controller: passwordController,
            validator: (value) {
              if ((value == null) || (value.isEmpty)) {
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
