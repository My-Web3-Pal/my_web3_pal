import 'package:web3_pal/features/auth/bloc/sign_up/sign_up_bloc.dart';

import '../../app/locator.dart';
import 'bloc/login/login_bloc.dart';

void setUpAuthenticationLocators() {
  getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());

  getIt.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
}
