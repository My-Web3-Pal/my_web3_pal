import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_pal/features/auth/views/login_view.dart';
import 'package:web3_pal/features/home/view/air_drops_view.dart';
import 'package:web3_pal/features/home/view/home_view.dart';

import '../../features/auth/views/create_account_view.dart';
import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case LoginView.routeName:
        return pageRoute(const LoginView());

      case CreateAccountView.routeName:
        return pageRoute(const CreateAccountView());

      case HomeScreen.routeName:
        return pageRoute(const HomeScreen());

      case AirDropView.routeName:
        return pageRoute(const AirDropView());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
