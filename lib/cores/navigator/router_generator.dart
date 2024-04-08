import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/Authentication/presentation/pages/pages.dart';
import '../../features/food_ordering/presentation/views/food_details_view.dart';
import '../../features/food_ordering/presentation/views/food_order_make_payment_view.dart';
import '../../features/food_ordering/presentation/views/order_check_out_page_view.dart';
import '../../features/laundry/views/screens/laundry_history_screen.dart';
import '../../features/laundry/views/screens/laundry_home_screen.dart';

import '../../features/home/views/screens/home_screen.dart';
import '../../features/laundry/views/screens/laundry_payment_screen.dart';
import '../../features/laundry/views/screens/laundry_options_list_screen.dart';
import '../../features/laundry/views/screens/laundry_user_details_screen.dart';
import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case IntroScreen.route:
        return pageRoute(const IntroScreen());

      case LoginView.route:
        return pageRoute(const LoginView());

      case SignUpView.route:
        return pageRoute(const SignUpView());

      case ForgotPasswordView.route:
        return pageRoute(const ForgotPasswordView());

      case HomeScreenView.routeName:
        return pageRoute(const HomeScreenView());

      case LaundryHomeScreen.routeName:
        return pageRoute(const LaundryHomeScreen());

      case LaundryOptionsListScreen.routeName:
        final LaundryType laundryType = args as LaundryType;
        return pageRoute(LaundryOptionsListScreen(laundryType));

      case LaundryUserDetailsScreen.routeName:
        return pageRoute(const LaundryUserDetailsScreen());

      case LaundryPaymentScreen.routeName:
        return pageRoute(const LaundryPaymentScreen());

      case LaundryHistoryScreen.routeName:
        return pageRoute(const LaundryHistoryScreen());

      case FoodDetailsView.routeName:
        return pageRoute(const FoodDetailsView());

      case OrderCheckOutPageView.routeName:
        return pageRoute(const OrderCheckOutPageView());

      case FoodOrderMakePaymentView.routeName:
        return pageRoute(const FoodOrderMakePaymentView());

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
