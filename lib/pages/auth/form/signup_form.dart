import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../widgets/widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmationController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            labelText: 'contraseña',
            controller: passwordController,
            validator: (value) {
              if ((value == null) || (value.isEmpty)) {
                return 'Campo requerido.';
              } else if (!regexPasswordStructure.hasMatch(value)) {
                return 'Insertar una contraseña más segura.';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          TextFormFieldPassword(
            labelText: 'Confirmar contraseña',
            controller: passwordConfirmationController,
            validator: (value) {
              if ((value == null) || (value.isEmpty)) {
                return 'Campo requerido';
              } else if (value.compareTo(passwordController.text) != 0) {
                return 'Las contraseñas no son iguales.';
              } else if (!regexPasswordStructure.hasMatch(value)) {
                return 'Insertar una contraseña más segura.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
