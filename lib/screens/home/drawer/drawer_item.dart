import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';
import '../../../style/theme_data.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData itemIcon;

  const DrawerItem({super.key, required this.title, required this.itemIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Row(
        children: [
          Icon(
            itemIcon,
            size: MediaQuery.of(context).size.width * 0.09,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            title,
            style: MyThemeData.lightModeStyle.textTheme.bodyMedium!
                .copyWith(color: AppColors.blackColor),
          )
        ],
      ),
    );
  }
}
