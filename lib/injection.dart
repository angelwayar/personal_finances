import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:get_it/get_it.dart';

import 'blocs/blocs.dart';

class Injector {
  static GetIt? _intenace;
  static GetIt get getIt => _intenace ??= GetIt.I;

  void initInjector() {
    Injector.getIt;
    final db = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    /// Blocs
    getIt.registerFactory(
      () => AccountRegisterBloc(db, storage),
    );
  }
}
