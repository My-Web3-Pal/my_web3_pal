import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/utils/utils.dart';

import '../../../cores/constants/constants.dart';

class AirDropView extends StatelessWidget {
  static const String routeName = '/air-drop';

  const AirDropView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomAppBarWidget(),
        verticalSpace(20),
        Center(child: TextWidget("Air Drops", fontSize: sp(24))),
        verticalSpace(40),
        ListView.separated(
          separatorBuilder: (_, int index) => verticalSpace(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (_, int index) {
            return buildOptionWidget(
              "ZKsync",
              "Get instant Airdrop to your wallet without fees",
            );
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcPrimaryColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildOptionWidget(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.all(Radius.circular(sr(10))),
      ),
      padding: EdgeInsets.symmetric(horizontal: w(18), vertical: h(14)),
      child: Row(children: [
        SizedBox(
          width: sw(70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              horizontalSpace(double.infinity),
              TextWidget(title, fontSize: sp(16), fontWeight: FontWeight.w600),
              TextWidget(value, fontSize: sp(13), withOpacity: 0.7),
            ],
          ),
        ),
        const Spacer(),
        horizontalSpace(),
        const Icon(CupertinoIcons.chevron_forward, color: kcWhite),
      ]),
    );
  }
}

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(FontAwesomeIcons.chevronLeft, color: kcWhite),
      horizontalSpace(50),
      const Spacer(),
      SizedBox(
        width: w(40),
        height: h(40),
        child: const Placeholder(color: kcWhite),
      ),
      const Spacer(),
      Row(children: [
        const Icon(CupertinoIcons.bell, color: kcWhite),
        horizontalSpace(10),
        CircleAvatar(radius: 20, backgroundColor: Colors.grey.withOpacity(0.8)),
      ]),
    ]);
  }
}
