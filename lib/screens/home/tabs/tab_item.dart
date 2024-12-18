import 'package:flutter/material.dart';
import 'package:news_app/style/app_colors.dart';

import '../../../model/SourceResponse.dart';
import '../../../style/theme_data.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.03),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: MyThemeData.lightModeStyle.textTheme.bodyMedium!.copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.primaryColor),
      ),
    );
  }
}
