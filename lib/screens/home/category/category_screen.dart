import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/screens/home/category/category_item.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:news_app/style/theme_data.dart';

class CategoryScreen extends StatelessWidget {
  var categoryList = Category.getCategory();

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.085),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: MyThemeData.lightModeStyle.textTheme.titleLarge!.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.022,
              ),
              itemBuilder: (context, index) => CategoryItem(
                index: index,
                category: categoryList[index],
              ),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
