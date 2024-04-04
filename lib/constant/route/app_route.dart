import 'package:flutter/material.dart';
import 'package:recipe_app/constant/route/app_route_name.dart';
import 'package:recipe_app/view/home.dart';
import 'package:recipe_app/view/login.dart';
import 'package:recipe_app/view/register.dart';
import 'package:recipe_app/view/welcome.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.getStarted:
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
          settings: settings,
        );

      case AppRouteName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      // Add more cases for additional routes here
      case AppRouteName.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.register:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      // Add more cases as needed
    }

    return null;
  }
}
