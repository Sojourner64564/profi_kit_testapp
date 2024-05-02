import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';

class InputDecorationForDrawerTextField{
  static InputDecoration getDecoration(String hintText){
    return InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: MyColors.myGreyColor),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: MyColors.myAppDarkGreyColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}