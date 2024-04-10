import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finances/core/constants/collections.constant.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._auth, this._db) : super(const SignUpInitial()) {
    on<SignUpUserSaved>(_onSignUpUserSaved);
  }

  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  _onSignUpUserSaved(SignUpUserSaved event, Emitter emit) async {
    try {
      emit(const SignUpInProgress());

      final email = event.email.trim();

      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: event.password.trim(),
      )
          .then((value) async {
        await _db.collection(kUser).add({'email': email});
      });

      emit(const SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(message: 'Ocurrio un Error: $e'));
    }
  }
}
