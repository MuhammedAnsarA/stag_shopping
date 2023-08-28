import 'package:flutter/material.dart';
import 'package:stag_shopping/utils/resources/global.dart';

class SplashScreen extends StatefulWidget {
  static const String routename = "/splash";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (context) => const SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (Global.storageService.getIsLoggedIn() == true) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/homepage", (route) => false);
        } else {
          Navigator.pushReplacementNamed(context, "/");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/icons/google.png")),
    );
  }
}
