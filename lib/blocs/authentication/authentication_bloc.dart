import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._auth) : super(const AuthenticationInitial()) {
    on<AuthenticationSignIn>(_onAuthenticationSignIn);
  }

  final FirebaseAuth _auth;

  _onAuthenticationSignIn(AuthenticationSignIn event, Emitter emit) async {
    try {
      emit(const AuthenticationInProgress());
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final email = event.email.trim();

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: event.password.trim(),
      );

      await prefs.setString('email', email);

      emit(AuthenticationSuccess(email: credential.user!.email!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        log('Ocurrio un error: $e');
        emit(AuthenticationFailure(message: 'Ocurrio un error: $e'));
      } else if (e.code == 'wrong-password') {
        log('Ocurrio un error: $e');
        // print('Wrong password provided for that user.');
        emit(AuthenticationFailure(message: 'Ocurrio un error: $e'));
      }
    } catch (e) {
      log('Ocurrio un error: $e');
      emit(AuthenticationFailure(message: 'Ocurrio un error: $e'));
    }
  }
}
