part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

final class AuthenticationInProgress extends AuthenticationState {
  const AuthenticationInProgress();
}

final class AuthenticationSuccess extends AuthenticationState {
  final String email;
  const AuthenticationSuccess({required this.email});
}

final class AuthenticationFailure extends AuthenticationState {
  final String message;
  const AuthenticationFailure({required this.message});
}
