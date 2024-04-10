import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/collections.constant.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this._db, this._storage) : super(const AccountInitial()) {
    on<AccountFetched>(_onAccountFetched);
  }

  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  _onAccountFetched(AccountFetched event, Emitter emit) async {
    try {
      List<Account> accounts = [];

      emit(const AccountInProgress());
      final storageRef = _storage.ref();

      await SharedPreferences.getInstance().then((value) async {
        final String? email = value.getString('email');

        await _db
            .collection(kAccount)
            .where(
              'email',
              isEqualTo: email,
            )
            .get()
            .then((event) async {
          if (event.docs.isEmpty) {
            // TODO: Se debe de retornar la lista vacia e indicar que registre en la vista
            // throw 'No se encontraron datos.';
          } else {
            for (var doc in event.docs) {
              var account = Account.fromJson(doc.data());

              if ((account.image != null) &&
                  (imgValidator(account.image!) == null)) {
                final imageURL = await storageRef
                    .child('finances/cad-bg/${account.image}')
                    .getDownloadURL();

                account = account.copyWith(image: imageURL);
              }

              accounts.add(account);
            }
          }
        });
      });

      emit(AccountSuccess(accounts: accounts));
    } catch (e) {
      emit(AccountFailure(message: 'Ocurrio un error: $e'));
    }
  }
}
