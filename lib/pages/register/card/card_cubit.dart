import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(const CardInitial());

  onInputChanged({String? account, String? totalBalance}) {
    emit(
      CardSuccess(
        account: account,
        totalBalance: totalBalance!.isEmpty ? '0.00' : totalBalance,
      ),
    );
  }
}
