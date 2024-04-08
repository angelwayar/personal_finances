part of 'account_register_bloc.dart';

sealed class AccountRegisterState extends Equatable {
  const AccountRegisterState();

  @override
  List<Object> get props => [];
}

final class AccountRegisterInitial extends AccountRegisterState {
  const AccountRegisterInitial();
}

final class AccountRegisterInProgress extends AccountRegisterState {
  const AccountRegisterInProgress();
}

final class AccountRegisterSuccess extends AccountRegisterState {
  const AccountRegisterSuccess();
}

final class AccountRegisterFailure extends AccountRegisterState {
  final String message;
  const AccountRegisterFailure({required this.message});
}
