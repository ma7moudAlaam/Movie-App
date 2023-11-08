import 'package:flutter/material.dart';

import 'package:movie/core/constants.dart';
import 'package:movie/model/home_view_mode/recommended_model.dart';

import 'package:movie/pages/home/widgets/movie_item_widget.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key, required this.results});

  final ResultsRecommended results;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQuery.height * 0.01,
          bottom: mediaQuery.height * 0.013,
          right: mediaQuery.width * 0.03),
      child: Container(
        width: mediaQuery.width * 0.259,
        decoration: const BoxDecoration(
            color: Color(0xFF343534),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieItemWidget(
              id: results.id.toString(),
              bookmarkVisible: true,
              title: results.title.toString(),
              imageNetwork: "${Constants.basicImage}${results.posterPath}",
              heightImage: mediaQuery.height * 0.143,
              widthImage: double.infinity,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFFBB3B),
                          size: 14,
                        ),
                        const SizedBox(
                          width: 1.5,
                        ),
                        Text(results.voteAverage.toString(),
                            style: theme.textTheme.bodyMedium)
                      ],
                    ),
                    Text(
                        overflow: TextOverflow.ellipsis,
                        results.title.toString(),
                        maxLines: 2,
                        style: theme.textTheme.bodyMedium),
                    Text(results.releaseDate.toString(),
                        style: theme.textTheme.bodySmall)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
