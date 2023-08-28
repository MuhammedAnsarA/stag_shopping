import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stag_shopping/src/authentication/data/repositories/login/login_repository.dart';
import 'package:stag_shopping/src/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:stag_shopping/src/authentication/presentation/widgets/border_circle_text.dart';
import 'package:stag_shopping/src/authentication/presentation/widgets/round_button.dart';
import 'package:stag_shopping/src/authentication/presentation/widgets/text_field.dart';
import 'package:stag_shopping/src/authentication/presentation/widgets/positioned_circle.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginPage(),
    );
  }

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: Stack(
                    children: [
                      rightCircle(),
                      topCircle(),
                      Positioned(
                        top: 145.h,
                        left: 42.w,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 300.h,
                              child: Image.asset(
                                "assets/png/shopping_5.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            textFieldContainer(
                                context,
                                "Email",
                                Icons.mail,
                                (value) => context
                                    .read<LoginBloc>()
                                    .add(EmailEvent(value))),
                            textFieldContainer(
                                context,
                                "Password",
                                Icons.lock,
                                (value) => context
                                    .read<LoginBloc>()
                                    .add(PasswordEvent(value))),
                            SizedBox(
                              height: 10.h,
                            ),
                            roundButton(context, "Log In", () {
                              LoginController(context: context).handleLogin();
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // orDivider(),
                // logos(() {
                //   GoogleController(context: context).signInWithGoogle();
                // }),
                SizedBox(
                  height: 15.h,
                ),
                borderCircle("Don't have an account? ", "Sign Up", () {
                  Navigator.pushNamed(context, "/signup");
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
