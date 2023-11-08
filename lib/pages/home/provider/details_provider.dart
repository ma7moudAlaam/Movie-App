import 'package:flutter/cupertino.dart';
import 'package:movie/core/network_layer/home_api_manager.dart';
import 'package:movie/model/home_view_mode/details_movie_model.dart';

import '../../../model/home_view_mode/more_like_model.dart';

class DetailsProvider extends ChangeNotifier {
  String? title, overview, posterPath, releaseDate;
  double? voteAverage;
  int? idList;
  List<Genres> _genresList = [];

  List<Genres> get genresList => _genresList;
  List<ResultsMoreLikeList>? _moreLikeList = [];

  List<ResultsMoreLikeList>? get moreLikeList => _moreLikeList;
  bool apiSuccess = false;

  Future<bool> getDetailsMovie(String id) async {
    var response = await HomeApiManager.fetchDetailsMovie(id);

    try {
      idList = response.id;
      title = response.title;
      overview = response.overview;
      posterPath = response.posterPath;
      releaseDate = response.releaseDate;
      voteAverage = response.voteAverage;
      _genresList = response.genres ?? [];
      apiSuccess = true;
      return Future.value(true);
      notifyListeners();
    } on Exception catch (e) {
      apiSuccess = false;
      return Future.value(false);
      // TODO
    }
  }

  Future<void> gatMoreLikeList(String id) async {
    var response = await HomeApiManager.fetchMoreLike(idList.toString());
    try {
      _moreLikeList = response.results ?? [];
      apiSuccess = true;
      notifyListeners();
    } on Exception catch (e) {
      apiSuccess = false;
      // TODO
    }
  }
}
