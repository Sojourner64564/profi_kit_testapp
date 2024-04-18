import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/flutter_widget/my_expansion_panel_list.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  const ExpansionPanelListWidget({super.key});

  @override
  State<ExpansionPanelListWidget> createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  bool isItExpanded = false;
  @override
  Widget build(BuildContext context) {
    return MyExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      materialGapSize: 0,
        elevation: 0,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            isItExpanded = isExpanded;
          });
        },
        children: [
          MyExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text('Межоперационные склады',
                style: TextStyle(
                  //fontSize: 10,//TODO -----------textStyle
                ),
                ),
              );
            },
            body: const ListTile(
              title: Text('Всякие склады'),
              subtitle: Text('Много складов'),
            ),
            isExpanded: isItExpanded,
          )
        ]);
  }
}

