import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/blocs.dart';
import '../../core/router/enum/name_page.enum.dart';
import '../../injection.dart';
import 'form/signin_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final autheticationBloc = Injector.getIt.get<AuthenticationBloc>();

    return BlocProvider<AuthenticationBloc>(
      create: (context) => autheticationBloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            context.push(NamePage.home.path, extra: state.email);
          }
        },
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    Container(
                      height: 140.0,
                      width: 80.0,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'Agregar logo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    SignForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(NamePage.signup.path);
                      },
                      child: const Text('Crear cuenta'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AuthenticationInProgress
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                autheticationBloc.add(
                                  AuthenticationSignIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                      child: state is AuthenticationInProgress
                          ? const CircularProgressIndicator()
                          : const Text('Iniciar sesion'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
