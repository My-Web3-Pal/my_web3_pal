import 'package:flutter/material.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/constants/constants.dart';
import 'package:web3_pal/cores/navigator/navigator.dart';
import 'package:web3_pal/cores/utils/utils.dart';
import 'package:web3_pal/features/auth/views/create_account_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        horizontalSpace(double.infinity),
        verticalSpace(100),
        Center(
          child: SizedBox(
            width: w(65),
            height: h(65),
            child: const Placeholder(color: kcWhite),
          ),
        ),
        verticalSpace(60),
        TextWidget("Log in", fontSize: sp(40), fontWeight: FontWeight.w600),
        verticalSpace(30),
        TextFieldWidget(hintText: "Username/Email", onChanged: (_) {}),
        verticalSpace(),
        TextFieldWidget(
          hintText: "Password",
          onChanged: (_) {},
          isPassword: true,
        ),
        verticalSpace(30),
        Button(text: "Log In", onTap: () {}),
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
      ]),
    );
  }
}
