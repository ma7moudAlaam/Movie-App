import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../model/browse_view_model/browse_movies_model.dart';
import '../../home/widgets/movie_item_widget.dart';

class BrowseMovieItem extends StatelessWidget {
  const BrowseMovieItem({super.key, required this.list});

  final MoviesCateogryResults list;

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
              date: list.releaseDate.toString(),
              originalTitle: list.originalTitle.toString(),
              ableNavigate: false,
              id: list.id.toString(),
              bookmarkVisible: false,
              title: list.title.toString(),
              imageNetwork: "${Constants.basicImage}${list.posterPath}",
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
                        Text(list.voteAverage.toString(),
                            style: theme.textTheme.bodyMedium)
                      ],
                    ),
                    Text(
                        overflow: TextOverflow.ellipsis,
                        list.title.toString(),
                        maxLines: 2,
                        style: theme.textTheme.bodyMedium),
                    Text(list.releaseDate.toString(),
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
