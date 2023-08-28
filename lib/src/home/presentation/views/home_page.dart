import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stag_shopping/src/authentication/data/repositories/google_sign/google_sign_repository.dart';

import '../../../../config/themes/colors.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homepage";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colours.skyBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: \n ${user.email}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            user.photoURL != null
                ? Image.network("${user.photoURL}")
                : Image.asset("assets/icons/profile_men.png"),
            user.displayName != null
                ? Text("${user.displayName}")
                : Container(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colours.darkGrey),
                onPressed: () {
                  GoogleController(context: context).signOut();
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: Text(
                  "Logout",
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
