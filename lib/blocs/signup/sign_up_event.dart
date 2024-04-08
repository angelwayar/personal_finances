part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpUserSaved extends SignUpEvent {
  final String email;
  final String password;

  const SignUpUserSaved({required this.email, required this.password});
}
