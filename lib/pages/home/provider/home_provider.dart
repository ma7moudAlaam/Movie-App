import 'package:flutter/cupertino.dart';
import 'package:movie/core/network_layer/home_api_manager.dart';

import '../../../model/home_view_mode/popular_movie_model.dart';
import 'package:movie/model/home_view_mode/new_releases_model.dart';

import '../../../model/home_view_mode/recommended_model.dart';

class HomeProvider extends ChangeNotifier {
  bool apiSuccess = false;
  List<ResultsPopular> _popularList = [];

  List<ResultsPopular> get popularList => _popularList;
  List<ResultsNewReleases> _newReleasesList = [];

  List<ResultsNewReleases> get newReleasesList => _newReleasesList;

  List<ResultsRecommended> _recommendedList = [];

  List<ResultsRecommended> get recommendedList => _recommendedList;

  getPopularList() async {
    var response = await HomeApiManager.fetchPopularMovie();

    try {
      _popularList = response.results ?? [];
      apiSuccess = true;
      notifyListeners();
    } on Exception catch (e) {
      apiSuccess = false;
      print(e);
      // TODO
    }
  }

  getRecommendedList() async {
    var response = await HomeApiManager.fetchRecommended();

    try {
      _recommendedList = response.results ?? [];
      apiSuccess = true;
      notifyListeners();
    } on Exception catch (e) {
      apiSuccess = false;
      print(e);
      // TODO
    }
  }

  getNewReleasesList() async {
    var response = await HomeApiManager.fetchNewReleases();

    try {
      _newReleasesList = response.results ?? [];
      notifyListeners();
      apiSuccess = true;
    } on Exception catch (e) {
      apiSuccess = false;
      print(e);
      // TODO
    }
  }
}
