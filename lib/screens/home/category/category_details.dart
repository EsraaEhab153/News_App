import 'package:flutter/material.dart';

import '../../../api/api_manager.dart';
import '../../../model/SourceResponse.dart';
import '../../../style/app_colors.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        // waiting to load data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
        // client side error
        else if (snapshot.hasError) {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text('try again')),
            ],
          );
        }
        // server response with data => (success or error)

        // error response
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text('try again')),
            ],
          );
        }
        // success response
        var sourceList = snapshot.data!.sources!;
        return TabWidget(sourcesList: sourceList);
      },
    );
  }
}
