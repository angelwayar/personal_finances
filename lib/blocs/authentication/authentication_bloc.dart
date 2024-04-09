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

      await _auth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      emit(const AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(message: 'Ocurrio un error: $e'));
    }
  }
}
