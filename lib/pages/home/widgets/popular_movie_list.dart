import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movie/pages/home/widgets/popular_movie_item.dart';

import '../../../model/home_view_mode/popular_movie_model.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key, required this.popularList});

  final List<ResultsPopular> popularList;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return CarouselSlider.builder(
        options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 4),
            clipBehavior: Clip.none,
            height: mediaQuery.height * 0.265,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal),
        itemCount: popularList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
                PopularMovieItem(results: popularList[itemIndex]),
                Positioned(
                  left: 15,
                  top: 88,
                  child: PopularChildMovie(results: popularList[itemIndex]),
                )
              ],
            ));

    // FutureBuilder(
    //   future: fetchPopularMovie,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Center(
    //             child: IconButton(
    //                 onPressed: () {
    //                   fetchPopularMovie;
    //                 },
    //                 icon: const Icon(Icons.refresh_outlined)),
    //           ),
    //         ],
    //       );
    //     } else if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       List<ResultsPopular> results = snapshot.data?.results ?? [];
    //       return
    //     }
    //   },
    // );
  }
}
