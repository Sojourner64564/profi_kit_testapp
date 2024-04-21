import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/widget/stock_list_tile.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {//TODO ◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: double.infinity, minWidth: 250),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
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

                    // const ExpansionPanelListWidget(), //TODO ---------
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
            ),
          ),
        ),
        Expanded(child: Container(color: Colors.green,)),

      ],
    );
  }
}



class NamesOfColumnsWidget extends StatelessWidget{
  const NamesOfColumnsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Center(child: const Text('Название')),
                    Container(
                      width: (MediaQuery.of(context).size.width-280)/3,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: const Text('Единицы измерения')),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width-280)/1.5,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: const Text('Артикул/код')),
                    ),
                  ],
                ),
              ),]
        ),
      ),
    );
  }
}
