import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/cubit/update_pager_cubit/update_pager_cubit.dart';

class PagePickerWidget extends StatefulWidget {
  const PagePickerWidget({super.key});

  @override
  State<PagePickerWidget> createState() => _PagePickerWidgetState();
}

class _PagePickerWidgetState extends State<PagePickerWidget> {
  String dropDownValue = '50';
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
            SizedBox(
              width: 315, //MediaQuery.of(context).size.width-300,
              height: 35,
              child: BlocBuilder<UpdatePagerCubit, UpdatePagerState>(
                bloc:updatePagerCubit,
                builder: (context, state) {
                  if(state is UpdatePagerStateInitial) return const Center(child:Text('Initial'));
                  if(state is UpdatePagerStateLoading) return const Center(child:Text('Loading'));
                  if(state is UpdatePagerStateError) return const Center(child:Text('Error'));
                  if(state is UpdatePagerStateEmpty) return const Center(child:Text('Empty'));
                  if(state is UpdatePagerStateLoaded){
                    return SizedBox(
                      width: 315, //MediaQuery.of(context).size.width-300,
                      height: 35,
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
                              splashColor: MyColors.myAppRedColor,
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: state.borderColor[index],
                                    width: 2,
                                  ),
                                ),
                                child: Center(child: Text('$myIndex',
                                style: TextStyle(
                                  color: state.numberColor[index],
                                ),
                                )),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                child: InkWell(
                  onTap: (){
                    updatePagerCubit.moveScrollPagerToTheEnd(scrollController);
                  },
                  borderRadius: BorderRadius.circular(5),
                  splashColor: MyColors.myAppRedColor,
                  child: Ink(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: MyColors.myGreyColor,
                        width: 2,
                      ),
                    ),
                    child: const Center(child: Icon(Icons.chevron_right)),
                  ),
                ),
              ),
            ),
            SizedBox(width: (MediaQuery
                .of(context)
                .size
                .width - 280) / 1.6,), //1.5
            const Text('Показывать по:'),
            const SizedBox(width: 10),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MyColors.myAppDarkGreyColor,
              ),
              child: Center(
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down,
                  color: MyColors.myWhiteColor,
                  ),
                  dropdownColor: MyColors.myAppDarkGreyColor,
                  elevation: 0,
                  value: dropDownValue,
                  items: const [
                    DropdownMenuItem(
                      value: '50',
                      child: Text('50',
                      style: MyTextStyle.myThinWhiteMediumTextStyle,
                      ),
                    ),
                    DropdownMenuItem(
                      value: '100',
                      child: Text('100',
                        style: MyTextStyle.myThinWhiteMediumTextStyle,),
                    ),
                    DropdownMenuItem(
                      value: '300',
                      child: Text('300',
                        style: MyTextStyle.myThinWhiteMediumTextStyle,),
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

