import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/colors.dart';

Widget pages(
  int index,
  BuildContext context,
  String imagePath,
  String title,
  String subTitle,
  String buttonName,
  PageController pageController,
) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 80.h),
        height: 400.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
      Text(
        title,
        style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20.h,
      ),
      Text(
        subTitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 15, color: Colours.darkGrey),
      ),
      SizedBox(
        height: 150.h,
      ),
      ElevatedButton(
        onPressed: () {
          if (index < 3) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          } else {
            Navigator.pushReplacementNamed(context, "/login");
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colours.skyBlue, fixedSize: const Size(150, 50)),
        child: Text(
          buttonName,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
