import 'package:flutter/cupertino.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/utils/utils.dart';

import '../../../cores/constants/constants.dart';
import 'air_drops_view.dart';

class NftPageView extends StatelessWidget {
  static const String routeName = '/nft';

  const NftPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomAppBarWidget(),
        verticalSpace(20),
        Center(child: TextWidget("NFTs", fontSize: sp(24))),
        verticalSpace(20),
        ListView.separated(
          separatorBuilder: (_, int index) => verticalSpace(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (_, int index) {
            return buildOptionWidget("Tier ${index + 1}");
          },
        ),
      ]),
    );
  }

  Widget buildOptionWidget(String title) {
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
