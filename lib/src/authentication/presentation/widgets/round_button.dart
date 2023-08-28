import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/colors.dart';

Widget roundButton(BuildContext context, String text, VoidCallback onTap) {
  return InkWell(
    borderRadius: BorderRadius.circular(30),
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        color: Colours.skyBlue,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
