import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';

Widget rightCircle() {
  return Positioned(
    top: 100.h,
    right: -50.w,
    child: Container(
      width: 100.h,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colours.skyBlue,
      ),
    ),
  );
}

Widget topCircle() {
  return Positioned(
    top: -50.h,
    left: -50.w,
    child: Container(
      width: 200.h,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colours.skyBlue,
      ),
    ),
  );
}
