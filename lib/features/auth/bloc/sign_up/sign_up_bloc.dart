// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../cores/utils/utils.dart';
import '../../services/auth_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService authService = AuthService();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      try {
        emit(SignUpLoading());

        final response = await authService.signup(
          event.username,
          event.email,
          event.password,
        );

        emit(SignUpSuccess(response: response));
      } catch (e, s) {
        LoggerHelper.log(e, s);
        emit(SignUpError(message: e.toString()));
      }
    });
  }
}
