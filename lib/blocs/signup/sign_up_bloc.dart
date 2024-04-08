import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._auth) : super(const SignUpInitial()) {
    on<SignUpUserSaved>(_onSignUpUserSaved);
  }

  final FirebaseAuth _auth;

  _onSignUpUserSaved(SignUpUserSaved event, Emitter emit) async {
    try {
      emit(const SignUpInProgress());

      await _auth.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      emit(const SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(message: 'Ocurrio un Error: $e'));
    }
  }
}
