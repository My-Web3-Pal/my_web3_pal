import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_pal/cores/components/components.dart';
import 'package:web3_pal/cores/constants/font_size.dart';
import 'package:web3_pal/cores/utils/utils.dart';

import '../../../cores/constants/constants.dart';
import 'air_drops_view.dart';

class ResourcesScreen extends StatefulWidget {
  static const String routeName = '/resources';

  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final List<String> _resources = [
    "Twitter Theards",
    "Course",
    "Videos",
    "PDFs",
    "Tutorials",
    "Podcasts"
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: false,
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w(kGlobalPadding)),
          child: const CustomAppBarWidget(),
        ),
        verticalSpace(),
        SizedBox(
          height: h(45),
          child: ListView.separated(
            padding: EdgeInsets.only(left: w(kGlobalPadding)),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, int index) => verticalSpace(),
            shrinkWrap: true,
            itemCount: _resources.length,
            itemBuilder: (_, int index) {
              final String value = _resources[index];

              return buildTagOptions(value);
            },
          ),
        ),
        verticalSpace(30),
        GridView.count(
          padding: EdgeInsets.symmetric(horizontal: w(kGlobalPadding)),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(10, (index) {
            return buildOptionWidget("NFTs");
          }),
        )
      ]),
    );
  }

  Widget buildTagOptions(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w(12), vertical: h(8)),
      margin: EdgeInsets.only(right: w(10)),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(sr(10)),
      ),
      child: Center(
        child: TextWidget(tag, fontSize: sp(16), fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildOptionWidget(String value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.all(Radius.circular(sr(10))),
      ),
      child: Column(children: [
        const ImageWidget(
          imageTypes: ImageTypes.asset,
          imageUrl: "assets/images/money_image.png",
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w(8), vertical: h(8)),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextWidget.bold(value, fontSize: sp(16)),
              const Icon(CupertinoIcons.chevron_forward, color: kcWhite),
            ]),
            verticalSpace(3),
            TextWidget(
              "Learn to create, Trade and mint Visual Arts",
              fontSize: sp(13),
              fontWeight: FontWeight.w600,
              withOpacity: 0.7,
              textAlign: TextAlign.left,
            ),
          ]),
        )
      ]),
    );
  }
}
