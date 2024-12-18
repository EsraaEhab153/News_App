import 'package:flutter/material.dart';
import 'package:news_app/screens/home/drawer/drawer_item.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:news_app/style/theme_data.dart';

class HomeDrawer extends StatelessWidget {
  static int categories = 1;
  static int settings = 2;
  Function onDrawerItemClick;

  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.primaryColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.10),
          child: Text(
            'News App !',
            style: MyThemeData.lightModeStyle.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(categories);
          },
          child: const DrawerItem(
            title: 'Categories',
            itemIcon: Icons.list,
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(settings);
          },
          child: const DrawerItem(
            title: 'Settings',
            itemIcon: Icons.settings,
          ),
        ),
      ],
    );
  }
}
