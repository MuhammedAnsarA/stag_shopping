import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/colors.dart';

Widget orDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 130),
    child: Row(
      children: [
        Flexible(
          child: Container(
            height: 1.h,
            color: Colours.darkBackground,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Flexible(
          child: Container(
            height: 1.h,
            color: Colours.darkBackground,
          ),
        ),
      ],
    ),
  );
}
