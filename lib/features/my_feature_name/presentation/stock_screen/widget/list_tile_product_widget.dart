import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';

class ListViewProductWidget extends StatelessWidget{
  const ListViewProductWidget({super.key, required this.itemsEntity});
  final ItemsEntity itemsEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.separated(
        itemCount: itemsEntity.results.length,
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
                    Text(itemsEntity.results[index].name), //название
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/3,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(itemsEntity.results[index].measurementUnit)),//единица измерения
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width-280)/1.5,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(itemsEntity.results[index].code)), //артикул код
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