import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/constants/collections.constant.dart';
import '../../models/models.dart';

part 'account_register_event.dart';
part 'account_register_state.dart';

class AccountRegisterBloc
    extends Bloc<AccountRegisterEvent, AccountRegisterState> {
  AccountRegisterBloc(
    this._db,
    this._storage,
  ) : super(const AccountRegisterInitial()) {
    on<AccountRegisterSaved>(_onRegisterAccountSaved);
  }

  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  _onRegisterAccountSaved(AccountRegisterSaved event, Emitter emit) async {
    try {
      final storageRef = _storage.ref();
      emit(const AccountRegisterInProgress());

      if (event.account.imageBg != null) {
        final filePath = event.account.imageBg!.path;
        final file = File(filePath);

        final imgBg = storageRef.child(
          'finances/cad-bg/${event.account.imageBg!.name}',
        );

        await imgBg.putFile(file).then((value) async {
          await _db.collection(kAccount).add(event.account.toJson());
        });
      } else {
        await _db.collection(kAccount).add(event.account.toJson());
      }

      emit(const AccountRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        emit(AccountRegisterFailure(message: 'Ocurrio un error: $e'));
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        emit(AccountRegisterFailure(message: 'Ocurrio un error: $e'));
      }
    } catch (e) {
      log('Ocurrio un error: $e');
      emit(AccountRegisterFailure(message: 'Ocurrio un error: $e'));
    }
  }
}
