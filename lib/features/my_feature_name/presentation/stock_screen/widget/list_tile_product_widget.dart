import 'package:flutter/material.dart';

class ListTileProductWidget extends StatelessWidget{
  const ListTileProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.separated(
        itemCount: 23,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                  const Text('Название'),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/3,
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Единицы измерения')),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/1.5,
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Артикул/код')),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/1.1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.add_a_photo_rounded),),
                    ),
                  ),
                ],),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1,
            color: Colors.black54,
          );
        },
      ),
    );
  }

}