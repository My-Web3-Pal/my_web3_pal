import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/locator.dart';
import '../../../cores/components/components.dart';
import '../../../cores/constants/constants.dart';
import '../../../cores/navigator/navigator.dart';
import '../../../cores/utils/utils.dart';
import '../../home/view/home_view.dart';
import '../bloc/sign_up/sign_up_bloc.dart';

class CreateAccountView extends StatefulWidget {
  static const String routeName = '/create-account';

  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;

  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final SignUpBloc signupBloc = getIt<SignUpBloc>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: BlocListener<SignUpBloc, SignUpState>(
        bloc: signupBloc,
        listener: (context, SignUpState state) {
          if (state is SignUpSuccess) {
            AppRouter.instance.navigateTo(HomeScreen.routeName);
          } else if (state is SignUpError) {
            SnackBarService.showErrorSnackBar(
              context: context,
              message: state.message,
            );
          }
        },
        child: Column(children: [
          horizontalSpace(double.infinity),
          verticalSpace(60),
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
          TextWidget("Sign Up", fontSize: sp(40), fontWeight: FontWeight.w600),
          verticalSpace(30),
          TextFieldWidget(
            textEditingController: _usernameController,
            hintText: "Username",
            validator: usernameValidator,
            onChanged: (_) => _checkIsValid(),
          ),
          verticalSpace(),
          TextFieldWidget(
            textEditingController: _emailController,
            validator: emailValidator,
            hintText: "Email",
            onChanged: (_) => _checkIsValid(),
          ),
          verticalSpace(),
          TextFieldWidget(
            textEditingController: _passwordController,
            validator: passwordValidator,
            hintText: "Password",
            onChanged: (_) => _checkIsValid(),
            isPassword: true,
          ),
          verticalSpace(30),
          BlocBuilder<SignUpBloc, SignUpState>(
            bloc: signupBloc,
            builder: (context, state) {
              if (state is SignUpLoading) return const Button.loading();

              return bottonWidget();
            },
          ),
          verticalSpace(10),
          Center(
            child: GestureDetector(
              onTap: AppRouter.instance.goBack,
              child: TwoSpanTextWidget(
                "Already have an account? ",
                "Log In",
                fontSize: sp(14),
                fontSize2: sp(14),
                textColor2: kcPrimaryColor,
                fontWeight2: FontWeight.w600,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  ValueListenableBuilder<bool> bottonWidget() {
    return ValueListenableBuilder(
      valueListenable: isValid,
      builder: (_, bool active, __) {
        return Button(
          active: active,
          text: "Log In",
          onTap: () {
            final email = _emailController.text;
            final password = _passwordController.text;
            final username = _usernameController.text;

            signupBloc.add(
              SignUp(email: email, password: password, username: username),
            );
          },
        );
      },
    );
  }

  void _checkIsValid() {
    final emailValid = emailValidator(_emailController.text) == null;
    final passwordValid = passwordValidator(_passwordController.text) == null;
    final usernameValid = usernameValidator(_usernameController.text) == null;

    isValid.value = emailValid && passwordValid && usernameValid;
  }
}
