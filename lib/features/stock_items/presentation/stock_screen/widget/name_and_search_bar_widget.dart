import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/global_keys/global_keys.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';

class NameAndSearchBarWidget extends StatelessWidget {
  NameAndSearchBarWidget({super.key});
  final fetchItemsCubit = getIt<FetchItemsCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Text('Номенклатура',
            style: MyTextStyle.myBigBlackTextStyle,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 130,
              child: Row(
                children: [
                  BlocBuilder<FetchItemsCubit, FetchItemsState>(
                    bloc: fetchItemsCubit,
                    builder: (context, state) {
                      if (state is FetchItemsStateInitial) return const Center(child: Text('Initial'));
                      if (state is FetchItemsStateLoading) return const Center(child: Text('Loading'));
                      if (state is FetchItemsStateEmpty) return const Center(child: Text('Empty'));
                      if (state is FetchItemsStateError) return const Center(child: Text('Error'));
                      if (state is FetchItemsStateLoaded) {
                        return Container(
                          decoration: BoxDecoration(
                            color: MyColors.myAppRedColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text('${state.entity.total.toString()} единиц/цы',
                              style: MyTextStyle.myThinWhiteMediumTextStyle,
                            ),
                          ),
                        );
                      }else{
                        return const Center(child: Text('Unknown Exception'));
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 280) / 2.3,
            ),
             SizedBox(
              width: 230,
              height: 40,
              child: SearchBar(
                shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                  borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(5), end: Radius.circular(0),),
                )),
                side: MaterialStateProperty.all(const BorderSide(color: MyColors.myGreyColor)),
                leading: const Icon(Icons.search),
                hintText: 'Поиск по названию',
                elevation: MaterialStateProperty.all(0),
              ),
            ),
            Container(
              width: 100,
              height: 40,
              decoration: const BoxDecoration(
                color: MyColors.myAppDarkGreyColor,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(0), right: Radius.circular(5)),
              ),
              child: const Center(child: Text('Поиск',
                style: MyTextStyle.myThinWhiteMediumTextStyle,
              )),
            ),
            const SizedBox(
              width: 20,
            ),
            Material(
              child: InkWell(
                onTap: (){
                  MyGlobalKeys.scaffoldStockScreenKey.currentState!.openEndDrawer();
                },
                borderRadius: BorderRadius.circular(5),
                splashColor: MyColors.myAppLightRedColor,
                child: Ink(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.myAppRedColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,
                      color: MyColors.myWhiteColor,
                      ),
                      Text('Новая позиция',
                        style: MyTextStyle.myThinWhiteMediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
