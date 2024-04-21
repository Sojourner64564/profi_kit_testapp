import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/list_tile_product_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/name_and_search_bar_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/names_of_columns_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_list_tile.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_or_transaction_button.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO ◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤ сделать с фиксированными размерами
    //TODO проверить виджет Table
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: 280,
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
                    color: Colors.black26,
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
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: NameAndSearchBarWidget(),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: NamesOfColumnsWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTileProductWidget(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
