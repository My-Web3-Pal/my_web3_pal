part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;

  const SignUpError({required this.message});
}

class SignUpSuccess extends SignUpState {
  final Map<String, dynamic> response;

  const SignUpSuccess({required this.response});
}
