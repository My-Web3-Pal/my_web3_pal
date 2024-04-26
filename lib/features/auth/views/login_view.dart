import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/constants/constants.dart';
import 'package:web3_pal/cores/navigator/navigator.dart';
import 'package:web3_pal/cores/utils/utils.dart';
import 'package:web3_pal/features/auth/bloc/login/login_bloc.dart';
import 'package:web3_pal/features/auth/views/create_account_view.dart';
import 'package:web3_pal/features/home/view/home_view.dart';

import '../../../app/locator.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final LoginBloc loginBloc = getIt<LoginBloc>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: BlocListener<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, LoginState state) {
          if (state is LoginSuccess) {
            AppRouter.instance.clearRouteAndPush(HomeScreen.routeName);
          } else if (state is LoginError) {
            SnackBarService.showErrorSnackBar(
              context: context,
              message: state.message,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalSpace(double.infinity),
            verticalSpace(100),
            Center(
              child: SizedBox(
                width: w(65),
                height: h(65),
                child: const ImageWidget(
                  imageUrl: "assets/images/app_icon.png",
                  imageTypes: ImageTypes.asset,
                ),
              ),
            ),
            verticalSpace(60),
            TextWidget(
              "Log in",
              fontSize: sp(40),
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(30),
            TextFieldWidget(
              hintText: "Username/Email",
              onChanged: (_) => _checkIsValid(),
              textEditingController: _emailController,
              validator: emailValidator,
            ),
            verticalSpace(),
            TextFieldWidget(
              textEditingController: _passwordController,
              hintText: "Password",
              onChanged: (_) => _checkIsValid(),
              isPassword: true,
              validator: passwordValidator,
            ),
            verticalSpace(30),
            BlocBuilder<LoginBloc, LoginState>(
              bloc: loginBloc,
              builder: (context, state) {
                if (state is LoginLoading) return const Button.loading();

                return buildButton();
              },
            ),
            verticalSpace(10),
            Center(
              child: GestureDetector(
                onTap: () => AppRouter.instance.navigateTo(
                  CreateAccountView.routeName,
                ),
                child: TwoSpanTextWidget(
                  "Don't have an account? ",
                  "Sign Up",
                  fontSize: sp(14),
                  fontSize2: sp(14),
                  textColor2: kcPrimaryColor,
                  fontWeight2: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: isValid,
      builder: (_, bool active, __) {
        return Button(
          active: active,
          text: "Log In",
          onTap: () {
            final email = _emailController.text;
            final password = _passwordController.text;

            loginBloc.add(Login(email: email, password: password));
          },
        );
      },
    );
  }

  void _checkIsValid() {
    final emailValid = emailValidator(_emailController.text) == null;
    final passwordValid = passwordValidator(_passwordController.text) == null;

    isValid.value = emailValid && passwordValid;
  }
}
