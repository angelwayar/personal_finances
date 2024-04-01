part of 'card_cubit.dart';

sealed class CardState extends Equatable {
  const CardState({
    this.account = '0000',
    this.totalBalance = '0.00',
  });

  final String? account;
  final String? totalBalance;

  @override
  List<Object?> get props => [account, totalBalance];
}

final class CardInitial extends CardState {
  const CardInitial() : super();
}

final class CardSuccess extends CardState {
  const CardSuccess({
    super.account,
    super.totalBalance,
  });
}
