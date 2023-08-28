import 'package:flutter/material.dart';
import 'package:stag_shopping/config/themes/colors.dart';

Widget textFieldContainer(BuildContext context, String text, IconData icon,
    void Function(String value)? func) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey.withAlpha(50),
    ),
    width: MediaQuery.sizeOf(context).width * 0.8,
    child: TextField(
      onChanged: (value) => func!(value),
      cursorColor: Colours.skyBlue,
      decoration: InputDecoration(
        hintText: text,
        icon: Icon(
          icon,
          color: Colours.darkBackground,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
