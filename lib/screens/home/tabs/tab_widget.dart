import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/screens/home/news/news_widget.dart';
import 'package:news_app/screens/home/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabWidget({super.key, required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source),
                      source: source))
                  .toList(),
            ),
            NewsWidget(source: widget.sourcesList[selectedIndex]),
          ],
        ));
  }
}
