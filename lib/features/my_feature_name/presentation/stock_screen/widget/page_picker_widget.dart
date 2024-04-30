import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/update_pager_cubit/update_pager_cubit.dart';

class PagePickerWidget extends StatefulWidget {
  const PagePickerWidget({super.key});

  @override
  State<PagePickerWidget> createState() => _PagePickerWidgetState();
}

class _PagePickerWidgetState extends State<PagePickerWidget> {
  String dropDownValue = '10';
  final updatePagerCubit = getIt<UpdatePagerCubit>();
  final fetchItemsCubit = getIt<FetchItemsCubit>();
  final ScrollController scrollController = ScrollController();

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
            BlocBuilder<UpdatePagerCubit, UpdatePagerState>(
              bloc:updatePagerCubit,
              builder: (context, state) {
                if(state is UpdatePagerStateInitial) return const Center(child:Text('Initial'));
                if(state is UpdatePagerStateLoading) return const Center(child:Text('Loading'));
                if(state is UpdatePagerStateError) return const Center(child:Text('Error'));
                if(state is UpdatePagerStateEmpty) return const Center(child:Text('Empty'));
                if(state is UpdatePagerStateLoaded){
                  return SizedBox(
                    width: 280, //MediaQuery.of(context).size.width-300,
                    height: 30,
                    child: ListView.builder(
                      itemCount: state.lenght,
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        final int myIndex = index+1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: (){
                              updatePagerCubit.tapOnButtonPager(index);
                              updatePagerCubit.moveScrollPager(index,scrollController);
                              fetchItemsCubit.fetchItemsWithDifPage(myIndex);
                            },
                            splashColor: Colors.redAccent,
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: state.borderColor[index],
                                  width: 2,
                                ),
                              ),
                              child: Center(child: Text('$myIndex')),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }else{
                  return const Center(child: Text('Unknown Exception'));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                child: const Center(child: Icon(Icons.schedule_send_rounded)),
              ),
            ),
            SizedBox(width: (MediaQuery
                .of(context)
                .size
                .width - 280) / 2,), //1.5
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
                      fetchItemsCubit.fetchItemsWithDifPageSize(newValue!);
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

