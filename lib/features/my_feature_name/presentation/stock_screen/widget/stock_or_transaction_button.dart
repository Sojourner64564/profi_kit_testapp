import 'package:flutter/material.dart';

class StockOrTransactionButton extends StatelessWidget{
  const StockOrTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.redAccent,
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
              color: Colors.green,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_alarm_sharp),
                SizedBox(width: 5),
                Text(
                  'Склады',
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        const Icon(Icons.account_tree_sharp),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_alarm_sharp),
                SizedBox(width: 5),
                Text(
                  'Транpзакции',
                ),
              ],
            ),
          ),
        ),
      ],),
    );
  }

}