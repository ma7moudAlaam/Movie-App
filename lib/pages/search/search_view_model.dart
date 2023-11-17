import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../core/network_layer/api_manager.dart';
import '../../models/movie_model.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchQuery = '';
  List<MovieModel> _movies = [];

  String get searchQuery => _searchQuery;

  List<MovieModel> get movies => _movies;

  changeSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  getMovies(String query) async {
    _searchQuery = query;

    try {
      var response = await ApiManager.search(query: query);
      _movies = response.results!;

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
