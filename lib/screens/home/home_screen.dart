import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/screens/home/category/category_details.dart';
import 'package:news_app/screens/home/category/category_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/style/theme_data.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/images/background_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              drawerSelectedItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: MyThemeData.lightModeStyle.textTheme.titleLarge,
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.width * 0.1),
                bottomRight:
                    Radius.circular(MediaQuery.of(context).size.width * 0.1),
              ),
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onDrawerItemClick: onDrawerItemClick,
            ),
          ),
          body: drawerSelectedItem == HomeDrawer.settings
              ? SettingsScreen()
              : selectedCategory == null
                  ? CategoryScreen(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  int drawerSelectedItem = HomeDrawer.categories;

  void onDrawerItemClick(int newDrawerSelectedItem) {
    drawerSelectedItem = newDrawerSelectedItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }
}
