import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/list_tile_product_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/name_and_search_bar_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/names_of_columns_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/page_picker_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_list_tile.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_or_transaction_button.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final fetchItemsCubit = getIt<FetchItemsCubit>();
  @override
  void initState() {
    fetchItemsCubit.initFetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO ◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤ сделать с фиксированными размерами
    //TODO попробовать поработать с виджет Table
    return Row(
      children: [
         Container(
           decoration: const BoxDecoration(
             border: Border(right: BorderSide(
               width: 2,
               color: MyColors.myLeftMenuBorderSideLightGrey,
             ),),
           ),
           child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 278,
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    StockOrTransactionButton(),
                    SizedBox(height: 15),
                    StockListTile(
                      title: 'Склад продукции',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Склад заготовок',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Хозяйственный склад',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Инструментальный склад',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Склад мерителей',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Склад ЗИП',
                      amount: '228',
                    ),
                    SizedBox(height: 20),
                    Divider(
                      indent: 5,
                      endIndent: 5,
                      color: MyColors.myBlack26Color,
                      thickness: 1,
                    ),
                    SizedBox(height: 20),
                    StockListTile(
                      title: 'Оборудование',
                      amount: '228',
                    ),
                  ],
                ),
              ),
            ),
                   ),
         ),
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width-300,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: NameAndSearchBarWidget(),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: NamesOfColumnsWidget(),
                ),
                SizedBox(
                  height: 650,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: BlocBuilder<FetchItemsCubit, FetchItemsState>(
                      bloc:fetchItemsCubit,
                      builder: (context, state) {
                        if(state is FetchItemsStateInitial) return const Center(child: Text('Initial'));
                        if(state is FetchItemsStateLoading) return const Center(child: Text('Loading'));
                        if(state is FetchItemsStateEmpty) return const Center(child: Text('Empty'));
                        if(state is FetchItemsStateError) return const Center(child: Text('Error'));
                        if(state is FetchItemsStateLoaded){
                          return ListViewProductWidget(itemsEntity: state.entity,);
                        }else{
                          return const Center(child: Text('Unknown Exception'));
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: PagePickerWidget()),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
