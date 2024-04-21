import 'package:flutter/material.dart';

class NamesOfColumnsWidget extends StatelessWidget{
  const NamesOfColumnsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      color: Colors.grey,
      child: ListView.builder(
        itemCount: 1,
        //itemBuilder: (BuildContext context, int index) {  },
        itemBuilder: (BuildContext context, int index) {
           return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(children: [
                  const Text('Corpus T4545BRUHHH'),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/3,
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('THK-13')),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/1.5,
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('yg65ng7')),
                  ),

                ],),
              ),
            ),
          );
  },
      ),
    );
  }
}