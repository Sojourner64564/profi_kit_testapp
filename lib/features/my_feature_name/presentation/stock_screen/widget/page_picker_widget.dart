import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/update_pager_cubit/update_pager_cubit.dart';

class PagePickerWidget extends StatefulWidget {
  const PagePickerWidget({super.key});

  @override
  State<PagePickerWidget> createState() => _PagePickerWidgetState();
}

class _PagePickerWidgetState extends State<PagePickerWidget> {
  String dropDownValue = 'One';
  final updatePagerCubit = getIt<UpdatePagerCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 30),
            SizedBox(
              width: 200, //MediaQuery.of(context).size.width-300,
              height: 30,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        //color: Colors.cyan,
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      child: Center(child: Text('$index')),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                 // color: Colors.cyan,
                    border: Border.all(
                        color: Colors.red,
                        width: 2,
                    ),

                ),
                child: const Center(child: Icon(Icons.schedule_send_rounded)),
              ),
            ),
            SizedBox(width: (MediaQuery.of(context).size.width-280)/1.5,),
            const Text('Показывать по:'),
            const SizedBox(width: 10),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan,
              ),
              child: Center(
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  value: dropDownValue,
                  items: const [
                    DropdownMenuItem(
                      value: '10',
                      child: Text('10'),
                    ),
                    DropdownMenuItem(
                      value: '50',
                      child: Text('50'),
                    ),
                    DropdownMenuItem(
                      value: '300',
                      child: Text('300'),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      //updatePagerCubit.updatePager(newValue!, );
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

