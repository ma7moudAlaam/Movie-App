import 'package:flutter/material.dart';
import 'package:movie/core/constants.dart';
import 'package:movie/model/home_view_mode/popular_movie_model.dart';
import 'package:movie/pages/home/widgets/movie_item_widget.dart';



class PopularMovieItem extends StatelessWidget {
 const PopularMovieItem({super.key, required this.results});

final ResultsPopular results;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            MovieItemWidget(
              ableNavigate: true,
              id: results.id.toString(),
              imageNetwork: "${Constants.basicImage}${results.posterPath}",
              heightImage: 217,
              widthImage: mediaQuery.width,
              bookmarkVisible: false,
              title: results.title.toString(),
            ),
            const ImageIcon(
              AssetImage("assets/icons/icon_display_popular.png"),
              size: 55,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class PopularChildMovie extends StatelessWidget {
 const PopularChildMovie({super.key, required this.results});

  final ResultsPopular results;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme=Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MovieItemWidget(
          ableNavigate: true,
            bookmarkVisible: true,
            title: results.title.toString(),
            imageNetwork: "${Constants.basicImage}${results.posterPath}",
            heightImage: mediaQuery.height * 0.22,
            widthImage: mediaQuery.width * 0.32,
            id: results.id.toString()),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.visible,
                results.title ?? "",
                style:theme.textTheme.titleSmall,
              ),
              SizedBox(
                height: mediaQuery.height * 0.008,
              ),
              Text(
                results.releaseDate ?? "",
                style: theme.textTheme.bodyMedium!.copyWith(color:const  Color(0xFFB5B4B4)) ,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
