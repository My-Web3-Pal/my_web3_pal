import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../utils/sizer_utils.dart';

class SafeAreaData {
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;

  const SafeAreaData({
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
  });
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    required this.body,
    this.appBar,
    this.usePadding = true,
    this.useSingleScroll = true,
    this.bg,
    this.scaffoldKey,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.scrollController,
    this.safeAreaData = const SafeAreaData(),
  });

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final AppBar? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? scrollController;
  final SafeAreaData safeAreaData;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black,
      ),
    );

    final EdgeInsets edgeInsets =
        EdgeInsets.symmetric(horizontal: usePadding ? sp(kGlobalPadding) : 0);

    return SizedBox(
      height: sh(100),
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        key: scaffoldKey,
        appBar: appBar,
        backgroundColor: bg ?? Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          top: safeAreaData.top,
          bottom: safeAreaData.bottom,
          left: safeAreaData.left,
          right: safeAreaData.right,
          child: SizedBox(
            height: sh(98),
            child: useSingleScroll
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    child: Padding(padding: edgeInsets, child: body),
                  )
                : Padding(padding: edgeInsets, child: body),
          ),
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
