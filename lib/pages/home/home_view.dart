import 'package:flutter/material.dart';
import 'package:movie/pages/home/provider/home_provider.dart';
import 'package:movie/pages/home/widgets/new_releases_lsit.dart';
import 'package:movie/pages/home/widgets/popular_movie_list.dart';
import 'package:movie/pages/home/widgets/recommended_list.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeProvider viewModel;

  @override
  void initState() {
    viewModel = HomeProvider();
    viewModel.getPopularList();
    viewModel.getRecommendedList();
    viewModel.getNewReleasesList();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeProvider>(
        builder: (context, vm, child) {
          if (vm.apiSuccess == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.only(top: mediaQuery.height * 0.028),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PopularMovieList(popularList: vm.popularList),
                SizedBox(
                  height: mediaQuery.height * 0.09,
                ),
                NewReleasesList(newReleasesList: vm.newReleasesList),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                RecommendedList(
                  recommendedList: vm.recommendedList,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
