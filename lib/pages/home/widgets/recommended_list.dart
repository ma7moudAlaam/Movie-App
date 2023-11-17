import 'package:flutter/material.dart';

import 'package:movie/pages/home/widgets/recommended_item.dart';

import '../../../model/home_view_mode/recommended_model.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key, required this.recommendedList});

  final List<ResultsRecommended> recommendedList;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme=Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: mediaQuery.height * 0.01,
        left:  mediaQuery.width * 0.04,
      ),
      height: mediaQuery.height * 0.28,
      width: mediaQuery.width,
      color: const Color(0xFF282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Recommended",
            style: theme.textTheme.titleSmall),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    RecommendedItem(results: recommendedList[index]),
                itemCount: recommendedList.length),
          )
        ],
      ),
    );
  }
}
