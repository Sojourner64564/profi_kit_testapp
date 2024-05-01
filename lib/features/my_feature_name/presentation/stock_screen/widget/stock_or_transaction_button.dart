import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';

class StockOrTransactionButton extends StatelessWidget{
  const StockOrTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 40,
      decoration: BoxDecoration(
        color: MyColors.myAppLightGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined),
                SizedBox(width: 5),
                Text(
                  'Склады',
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        const Icon(Icons.sync_alt,
        size: 20,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Транзакции',
                ),
              ],
            ),
          ),
        ),
      ],),
    );
  }

}