import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/stock_screen/stock_screen.dart';

class MainTabBarScaffold extends StatelessWidget{
  const MainTabBarScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
              const Expanded(
                  child: Text(
                    'PROFI KIT',
                    style: MyTextStyle.myAppTitleTextStyle,
                  )),
            ],
          ),
          centerTitle: true,
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 40,
              width: 1230,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: MyColors.myTransparentColor,
                labelColor: MyColors.myWhiteColor,
                labelStyle: MyTextStyle.myAppTabViewTextStyle,
                splashBorderRadius: BorderRadius.circular(10),
                indicator: BoxDecoration(
                  color: MyColors.myAppRedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: const [
                  Tab(
                    child: Text('KIT CRM'),
                  ),
                  Tab(
                    child: Text('KIT Master'),
                  ),
                  Tab(
                    child: Text('KIT Tracker'),
                  ),
                  Tab(
                    child: Text('KIT Warehouse'),
                  ),
                  Tab(
                    child: Text('KIT ARM'),
                  ),
                  Tab(
                    child: Text('KIT Dashboard'),
                  ),
                  Tab(
                    child: Text('KIT Admin'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const StockScreen(),
            Container(color: Colors.deepPurple),
            Container(color: Colors.deepPurple),
            Container(color: Colors.deepPurple),
            Container(color: Colors.deepPurple),
            Container(color: Colors.deepPurple),
            Container(color: Colors.deepPurple),
          ],
        ), //
      ),
    );
  }

}