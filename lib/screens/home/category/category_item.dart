import 'package:flutter/material.dart';
import 'package:news_app/style/theme_data.dart';

import '../../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.03),
            topRight:
                Radius.circular(MediaQuery.of(context).size.height * 0.03),
            bottomRight: Radius.circular((index % 2 == 0)
                ? 0
                : MediaQuery.of(context).size.height * 0.03),
            bottomLeft: Radius.circular((index % 2 == 0)
                ? MediaQuery.of(context).size.height * 0.03
                : 0),
          )),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            category.title,
            style: MyThemeData.lightModeStyle.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
