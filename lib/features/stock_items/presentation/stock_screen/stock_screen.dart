import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/global_keys/global_keys.dart';
import 'package:profi_kit_testapp/features/add_items/presentation/add_items_end_drawer/add_items_end_drawer.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/stock_screen/stock_page.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: MyGlobalKeys.scaffoldStockScreenKey,
      endDrawer: AddItemsEndDrawer(),
      body: const StockPage(),//
    );
  }
}
