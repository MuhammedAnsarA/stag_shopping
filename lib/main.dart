import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stag_shopping/config/router/app_router.dart';
import 'package:stag_shopping/src/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:stag_shopping/src/authentication/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:stag_shopping/src/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:stag_shopping/src/authentication/presentation/views/splash/splash_screen.dart';
import 'package:stag_shopping/utils/resources/global.dart';

void main() async {
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(
            412,
            868,
          ),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Stag Shopping',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: SplashScreen.routename,
            );
          }),
    );
  }
}
