part of 'account_register_bloc.dart';

sealed class AccountRegisterEvent extends Equatable {
  const AccountRegisterEvent();

  @override
  List<Object> get props => [];
}

final class AccountRegisterSaved extends AccountRegisterEvent {
  final Account account;
  const AccountRegisterSaved({required this.account});
}
