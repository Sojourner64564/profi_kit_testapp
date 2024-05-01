import 'package:flutter/cupertino.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';

class MyTextStyle{
  static const myThinWhiteMediumTextStyle = TextStyle(
    color: MyColors.myWhiteColor,
    fontSize: 13,
  );
  static const myThinBlackMediumTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const myBigBlackTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );
  static const myAppTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static const myAppTabViewTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );
}