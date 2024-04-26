import 'package:flutter/material.dart';

class NamesOfColumnsWidget extends StatelessWidget {
  const NamesOfColumnsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.grey,
      child: ListView.builder(
        itemCount: 1,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 0, 10),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    const Text('Название'),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 280) / 3,
                      child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text('Единица измерения')),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 280) / 1.5,
                      child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text('Артикул/код')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
