import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';

class StockListTile extends StatelessWidget{
  const StockListTile({super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
      Text(title),
      Container(
        decoration: BoxDecoration(
          color: MyColors.myAppRedColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(amount,
          style: MyTextStyle.myThinWhiteMediumTextStyle,
          ),
        ),
      ),
    ],);
  }

}