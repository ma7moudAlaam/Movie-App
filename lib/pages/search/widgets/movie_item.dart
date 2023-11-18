import 'package:flutter/material.dart';

import '../../../core/constants.dart';

import '../../../models/movie_model.dart';
import '../../home/widgets/movie_item_widget.dart';

class MovieItem extends StatelessWidget {
  final MovieModel model;

  const MovieItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          child: Row(
            children: [
              MovieItemWidget(bookmarkVisible: false,
                  id: model.id.toString(),
                  title: model.title.toString(),
                  heightImage: 90,
                  imageNetwork: "${Constants.basicImage}${model.posterPath}",
                  ableNavigate: true,
                  date: model.releaseDate.toString(),
                  originalTitle: model.originalTitle.toString(),
                  widthImage: 140),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        model.releaseDate!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        model.originalLanguage!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: const Divider(
            height: 2,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
