import 'package:flutter/widgets.dart';
import 'package:movie/core/network_layer/browse_api_manager.dart';
import 'package:movie/model/browse_view_model/browse_category_mode.dart';

import '../../../model/browse_view_model/browse_movies_model.dart';

class BrowseProvider extends ChangeNotifier {
  bool apiSuccess = false;
  List<Genres> _categoryList = [];

  List<Genres> get categoryList => _categoryList;
  List<MoviesCateogryResults> _movieList = [];

  List<MoviesCateogryResults> get movieList => _movieList;

  Future<void> getCategoryList() async {
    var response = await BrowseApiManager.getCategory();

    try {
      _categoryList = response.genres ?? [];
      apiSuccess = true;
      notifyListeners();
    } on Exception catch (e) {
      apiSuccess = false;
      print(e);
      // TODO
    }
  }

  Future<void> getMoviesList(int id) async {
    var response = await BrowseApiManager.getMovies(genreId: id);

    try {
      _movieList = response.results ?? [];
      apiSuccess = true;
      notifyListeners();
      print(_movieList);
    } on Exception catch (e) {
      apiSuccess = false;

      print(e);
      // TODO
    }
  }
}
