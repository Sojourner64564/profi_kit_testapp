import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/stock_page.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myAppLightGreyColor,
        leadingWidth: 150,
        leading: Row(
          children: [
            const SizedBox(width: 5),
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/image/app_logo.png'),
            ),
            const SizedBox(width: 8),
            const Expanded(child: Text('PROFI KIT',
            style: MyTextStyle.myAppTitleTextStyle,
            )),
          ],
        ),
        centerTitle: true,
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text('KIT CRM'),
              SizedBox(width: 50),
              Text('KIT Master'),
              SizedBox(width: 50),
              Text('KIT Tracker'),
              SizedBox(width: 50),
              Text('KIT Warehouse'),
              SizedBox(width: 50),
              Text('KIT ARM'),
              SizedBox(width: 50),
              Text('KIT Dashboard'),
              SizedBox(width: 50),
              Text('KIT Admin'),
            ],
          ),
        ),
      ),
      body: const StockPage(),
    );
  }
}
