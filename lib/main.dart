import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/features/fdgdfg/my_cubit.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/stock_screen/stock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StockScreen(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final myCubit = MyCubit();

  @override
  Widget build(BuildContext context) {
    myCubit.fuckingShit();
    return Scaffold(
      body: Container(color: Colors.green),
    );
  }
}
