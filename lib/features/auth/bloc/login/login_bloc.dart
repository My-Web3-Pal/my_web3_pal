// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web3_pal/cores/utils/utils.dart';
import 'package:web3_pal/features/auth/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService = AuthService();

  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      try {
        emit(LoginLoading());

        final response = await authService.login(event.email, event.password);

        emit(LoginSuccess(response: response));
      } catch (e, s) {
        LoggerHelper.log(e, s);
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
