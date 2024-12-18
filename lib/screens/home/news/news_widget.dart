import 'package:flutter/material.dart';
import 'package:news_app/screens/home/news/news_item.dart';

import '../../../api/api_manager.dart';
import '../../../model/NewsResponse.dart';
import '../../../model/SourceResponse.dart';
import '../../../style/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNews(widget.source.id ?? ''),
        builder: (context, snapshot) {
          // waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          // clint side error
          else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('something went wrong please try again'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNews(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: const Text('tyr again'))
              ],
            );
          }
          // server response => success , error
          // error case
          else if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNews(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: const Text('tyr again'))
              ],
            );
          }
          // success case

          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,
            ),
          );
        });
  }
}
