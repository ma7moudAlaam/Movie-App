import 'package:flutter/material.dart';
import 'package:movie/pages/browse/provider/browse_view_provide.dart';
import 'package:movie/pages/browse/widgets/browse_movie_item.dart';
import 'package:provider/provider.dart';

class BrowseFilmView extends StatefulWidget {
  const BrowseFilmView({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<BrowseFilmView> createState() => _BrowseFilmViewState();
}

class _BrowseFilmViewState extends State<BrowseFilmView> {
  late BrowseProvider viewModel;

  @override
  void initState() {
    viewModel = BrowseProvider();
    viewModel.getMoviesList(widget.id);

    // Future.wait([viewModel.getMoviesList(), viewModel.getGenreIds()])
    //     .then((value) {
    //   if (value[0] == true) {
    //     return viewModel.getGenreIds();
    //   }
    //   if (value[1] == true) {
    //     return viewModel.listFinish(widget.id);
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<BrowseProvider>(
        builder: (context, vm, child) {
          if (vm.apiSuccess == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.only(
                left: mediaQuery.width * 0.04,
                right: mediaQuery.width * 0.04,
                top: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 9 / 6,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: vm.movieList.length,
                  itemBuilder: (context, index) {
                    // List<int> m = viewModel.movieList[index].genreIds ?? [];
                    // for (int i = 0; i < m.length; i++) {
                    //   if (widget.id == m[i].toString()) {
                    //     return BrowseMovieItem(
                    //         list: viewModel.movieList[index]);
                    //   }
                    //   return BrowseMovieItem(
                    //       list: viewModel.movieList[index]);
                    // }
                    return BrowseMovieItem(list: vm.movieList[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
