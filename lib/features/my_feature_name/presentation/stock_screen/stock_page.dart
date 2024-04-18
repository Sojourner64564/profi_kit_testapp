import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profi_kit_testapp/core/flutter_widget/my_expansion_panel_list.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/expansion_panel_list_widget.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_list_tile.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: double.infinity, minWidth: 300),

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 50,
                 // width: double.infinity, //TODO double.ibnfinity
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          //width: double.infinity,
                         // height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_alarm_sharp),
                              SizedBox(width: 5),
                              Text(
                                'Склады',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(Icons.account_tree_sharp),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          //width: double.infinity,
                         // height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.abc_sharp),
                                SizedBox(width: 5),
                                Text(
                                  'Транзакции',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

               // const ExpansionPanelListWidget(),
                const StockListTile(
                  title: 'Склад продукции',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Склад заготовок',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Хозяйственный склад',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Инструментальный склад',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Склад мерителей',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Склад ЗИП',
                  amount: '228',
                ),
                const SizedBox(height: 20),
                const Divider(
                  indent: 5,
                  endIndent: 5,
                  color: Colors.black26,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                const StockListTile(
                  title: 'Оборудование',
                  amount: '228',
                ),
              ],
            ),
          ),

         /* Flexible(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      // width: 50,
                      //height: 50,
                      color: Colors.green,
                    ),
                  ),
                ],
              )),*/
        ],
      ),
    );
  }
}
