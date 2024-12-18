import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:news_app/style/theme_data.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.26,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            news.author ?? '',
            style: MyThemeData.lightModeStyle.textTheme.bodySmall!.copyWith(
              color: AppColors.grayColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            news.title ?? '',
            style: MyThemeData.lightModeStyle.textTheme.bodyMedium!.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            DateFormat.jm().format(DateTime.parse(news.publishedAt ?? '')),
            style: MyThemeData.lightModeStyle.textTheme.bodySmall!.copyWith(
              color: AppColors.grayColor,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
