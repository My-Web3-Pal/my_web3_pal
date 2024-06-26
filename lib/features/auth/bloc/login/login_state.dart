part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
}

class LoginSuccess extends LoginState {
  final Map<String, dynamic> response;

  const LoginSuccess({required this.response});
}
