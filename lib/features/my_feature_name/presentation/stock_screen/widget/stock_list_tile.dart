import 'package:flutter/material.dart';

class StockListTile extends StatelessWidget{
  const StockListTile({super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title),
      const Expanded(child: SizedBox()),
      Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(amount),
        ),
      ),
    ],);
  }

}