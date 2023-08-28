import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logos(VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 60.h,
        width: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    ),
  );
}
