import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cores/constants/color.dart';
import '../cores/navigator/app_navigation_observer.dart';
import '../cores/navigator/app_router.dart';
import '../cores/navigator/router_generator.dart';
import '../features/home/views/screens/home_screen.dart';
import 'locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // static final ToggleDarkModeBloc _toggleDarkModeBloc =
  //     getIt<ToggleDarkModeBloc>();
  static final AppNavObserver _appNavObserver = getIt<AppNavObserver>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // LaundryService().uploadOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, Widget? child) {
        return MaterialApp(
          title: 'Recon App',
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          initialRoute: HomeScreenView.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [MyApp._appNavObserver],
        );
      },
    );
  }
}
