import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

      final credential = await _auth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

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
