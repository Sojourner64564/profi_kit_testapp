import 'package:flutter/material.dart';

class NameAndSearchBarWidget extends StatelessWidget{
  const NameAndSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Text('Номенкулатура'),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text('54 edinitsi'),
              ),
            ),
            SizedBox(width: (MediaQuery.of(context).size.width-280)/2,),
            const SizedBox(
              width: 230,
              height: 40,
              child: SearchBar(),
            ),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(child: Text('Поиск')),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text('Новая позиция'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}