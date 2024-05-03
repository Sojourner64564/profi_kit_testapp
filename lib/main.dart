import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/main_tab_bar_scaffold/main_tab_bar_scaffold.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainTabBarScaffold(),
    );
  }
}


