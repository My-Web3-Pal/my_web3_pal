import 'package:flutter/material.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/utils/sizer_utils.dart';

import '../../../cores/constants/constants.dart';
import 'air_drops_view.dart';

class MyAlphaView extends StatefulWidget {
  static const String routeName = '/my-alpha';

  const MyAlphaView({super.key});

  @override
  State<MyAlphaView> createState() => _MyAlphaViewState();
}

class _MyAlphaViewState extends State<MyAlphaView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(children: [
        const CustomAppBarWidget(),
        verticalSpace(20),
        Row(children: [
          TextWidget("14 Result", fontSize: sp(14), withOpacity: 0.8),
          const Spacer(),
          TextWidget("My Alpha", fontSize: sp(24), fontWeight: FontWeight.w500),
          const Spacer(),
          const Icon(Icons.more_vert, color: kcWhite),
        ]),
        verticalSpace(30),
        Row(children: [
          const Expanded(
            child: DropDownWidget(items: ['Twitter'], hintText: "Twitter"),
          ),
          horizontalSpace(20),
          const Expanded(
            child: DropDownWidget(items: ['All'], hintText: "Timeframe"),
          ),
        ]),
        verticalSpace(),
        ListView.separated(
          separatorBuilder: (_, int index) => verticalSpace(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (_, int index) {
            return buildOptionWidget(
              "My Web3 Pal",
              "My alphas . Tweet . @dasilva19",
            );
          },
        )
      ]),
    );
  }

  Widget buildOptionWidget(String title, String value) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget("15 mins ago", fontSize: sp(14), withOpacity: 0.8),
        ),
        verticalSpace(5),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff1A1A1A),
            borderRadius: BorderRadius.all(Radius.circular(sr(10))),
          ),
          padding: EdgeInsets.symmetric(horizontal: w(8)),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(children: [
                ImageWidget(
                  imageTypes: ImageTypes.asset,
                  imageUrl: "assets/images/app_icon.png",
                  height: h(24),
                  width: w(24),
                ),
                horizontalSpace(5),
                SizedBox(
                  width: sw(64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      horizontalSpace(double.infinity),
                      TextWidget(
                        title,
                        fontSize: sp(16),
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(value, fontSize: sp(13), withOpacity: 0.7),
                    ],
                  ),
                ),
              ]),
              childrenPadding: EdgeInsets.zero,
              children: [
                ImageWidget(
                  imageTypes: ImageTypes.asset,
                  imageUrl: "assets/images/tweet_mock_up.png",
                  width: double.infinity,
                  height: h(120),
                ),
                verticalSpace(5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    "https://twitter.com/ether/652gwhdb4",
                    fontSize: sp(14),
                    fontWeight: FontWeight.w600,
                    textColor: Colors.blue,
                  ),
                ),
                verticalSpace(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
