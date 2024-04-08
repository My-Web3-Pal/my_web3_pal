import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cores/constants/color.dart';
import '../cores/navigator/app_router.dart';
import '../cores/navigator/router_generator.dart';
import '../features/auth/views/login_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, Widget? child) {
        return MaterialApp(
          title: "Web3 Pal",
          themeMode: ThemeMode.dark,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          initialRoute: LoginView.routeName, // HomeScreenView.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
