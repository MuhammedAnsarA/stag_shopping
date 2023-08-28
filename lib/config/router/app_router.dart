import 'package:flutter/material.dart';
import 'package:stag_shopping/src/authentication/presentation/views/splash/splash_screen.dart';
import 'package:stag_shopping/src/home/presentation/views/home_page.dart';
import 'package:stag_shopping/src/authentication/presentation/views/login/login_page.dart';
import 'package:stag_shopping/src/authentication/presentation/views/onboarding/onboarding_page.dart';
import 'package:stag_shopping/src/authentication/presentation/views/sign_up/sign_up_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingPage.routeName:
        return OnboardingPage.route();
      case HomePage.routeName:
        return HomePage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case RegisterPage.routeName:
        return RegisterPage.route();
      case SplashScreen.routename:
        return SplashScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "/error"),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Something went wrong!!")),
      ),
    );
  }
}
