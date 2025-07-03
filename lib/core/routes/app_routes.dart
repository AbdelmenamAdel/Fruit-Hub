import 'package:fruit_hub/core/Routes/base_routes.dart';
import 'package:fruit_hub/core/common/screens/page_under_build.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/home/main_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initial = '/';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String main = 'main';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case initial:
        return BaseRoute(page: const SplashView());
      case onBoarding:
        return BaseRoute(page: const OnBoardingView());
      case login:
        return BaseRoute(page: const LoginView());
      case signUp:
        return BaseRoute(page: const SignupView());
      case main:
        return BaseRoute(page: const MainView());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
