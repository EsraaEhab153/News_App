import 'package:flutter/material.dart';
import 'package:news_app/style/app_colors.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.backgroundColor});

  static List<Category> getCategory() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          backgroundColor: AppColors.redColor),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          backgroundColor: AppColors.blueColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          backgroundColor: AppColors.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          backgroundColor: AppColors.orangeColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/entertainment.png',
          backgroundColor: AppColors.lightBlueColor),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          backgroundColor: AppColors.yellowColor),
      Category(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/technology 1.png',
          backgroundColor: AppColors.purpleColor),
    ];
  }
}
