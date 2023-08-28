import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget borderCircle(String text, String buttonText, VoidCallback onTap) {
  return Container(
    width: double.infinity,
    height: 70.h,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
      color: Colors.blueGrey.withAlpha(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
