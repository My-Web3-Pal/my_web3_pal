import 'package:flutter/material.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/navigator/navigator.dart';
import 'package:web3_pal/cores/utils/utils.dart';

import '../../../cores/constants/constants.dart';

class CreateAccountView extends StatelessWidget {
  static const String routeName = '/create-account';

  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(children: [
        horizontalSpace(double.infinity),
        verticalSpace(60),
        Center(
          child: SizedBox(
            width: w(65),
            height: h(65),
            child: const Placeholder(color: kcWhite),
          ),
        ),
        verticalSpace(60),
        TextWidget("Sign Up", fontSize: sp(40), fontWeight: FontWeight.w600),
        verticalSpace(30),
        TextFieldWidget(hintText: "Username", onChanged: (_) {}),
        verticalSpace(),
        TextFieldWidget(hintText: "Email", onChanged: (_) {}),
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
    );
  }
}
