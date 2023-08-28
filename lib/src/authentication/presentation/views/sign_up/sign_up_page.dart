import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stag_shopping/src/authentication/data/repositories/sign_up/sign_up_repository.dart';
import 'package:stag_shopping/src/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';

import '../../widgets/border_circle_text.dart';
import '../../widgets/positioned_circle.dart';
import '../../widgets/round_button.dart';
import '../../widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = "/signup";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const RegisterPage(),
    );
  }

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.89,
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
                              height: 300.h,
                              child: Image.asset(
                                "assets/png/shopping_3.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            textFieldContainer(
                                context,
                                "Username",
                                Icons.person,
                                (value) => context
                                    .read<SignUpBloc>()
                                    .add(UsernameEvent(value))),
                            textFieldContainer(
                                context,
                                "Email",
                                Icons.mail,
                                (value) => context
                                    .read<SignUpBloc>()
                                    .add(EmailEvent(value))),
                            textFieldContainer(
                                context,
                                "Password",
                                Icons.lock,
                                (value) => context
                                    .read<SignUpBloc>()
                                    .add(PasswordEvent(value))),
                            // textFieldContainer(
                            //     context,
                            //     "Confirm Password",
                            //     Icons.lock,
                            //     (value) => context
                            //         .read<SignUpBloc>()
                            //         .add(ConfirmPasswordEvent(value))),
                            SizedBox(
                              height: 10.h,
                            ),
                            roundButton(context, "Sign Up", () {
                              SignUpController(context: context).handleSignUp();
                            }),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                borderCircle("Already have an account? ", "Log In", () {
                  Navigator.pushNamed(context, "/login");
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
