import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finances/core/router/enum/name_page.enum.dart';

import '../../blocs/blocs.dart';
import '../../injection.dart';
import 'form/signin_form.dart';
import 'signup.page.dart';

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
            context.push(NamePage.home.path);
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
                      child: const Text('Agregar logo'),
                    ),
                    SignForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpPage(),
                    ),
                  );
                },
                child: const Text('Crear cuenta'),
              ),
              const Spacer(),
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
