part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {
  const AccountInitial();
}

final class AccountInProgress extends AccountState {
  const AccountInProgress();
}

final class AccountSuccess extends AccountState {
  final List<Account> accounts;
  const AccountSuccess({required this.accounts});
}

final class AccountFailure extends AccountState {
  final String message;
  const AccountFailure({required this.message});
}
