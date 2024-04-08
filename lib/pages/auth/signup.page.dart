import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finances/pages/auth/form/signup_form.dart';

import '../../blocs/blocs.dart';
import '../../injection.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmationController = TextEditingController();
    final signUpBloc = Injector.getIt.get<SignUpBloc>();

    return BlocProvider<SignUpBloc>(
      create: (context) => signUpBloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    children: [
                      const Text(
                        'Registrate',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      SignUpForm(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        passwordConfirmationController:
                            passwordConfirmationController,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 24.0,
                      ),
                      child: ElevatedButton(
                        onPressed: state is SignUpInProgress
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  signUpBloc.add(
                                    SignUpUserSaved(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                        child: state is SignUpInProgress
                            ? const CircularProgressIndicator()
                            : const Text('Iniciar sesion'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
