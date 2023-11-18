import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/core/constants.dart';
import 'package:movie/model/browse_view_model/browse_category_mode.dart';
import 'package:movie/model/browse_view_model/browse_movies_model.dart';

class BrowseApiManager {
  static Future<BrowseModel> getCategory() async {
    Map<String, dynamic>? queryParameters = {
      "api_key": Constants.apiKey,
    };

    Uri uri =
        Uri.https(Constants.basUlrHome, "/3/genre/movie/list", queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var browseModel = BrowseModel.fromJson(jsonDecode(response.body));
      return browseModel;
    } else {
      throw Exception("failed to load Category");
    }
  }

  static Future<BrowseMoviesModel> getMovies({required int genreId}) async {
    Map<String, dynamic>? queryParameters = {
      "api_key": Constants.apiKey,
      "with_genres": 28
    };

    Uri uri =
        Uri.https(Constants.basUlrHome, '/3/discover/movie', queryParameters);
    final response = await http.get(uri);
    print("response$response");

    if (response.statusCode == 200) {
      var browseMoviesModel =
          BrowseMoviesModel.fromJson(jsonDecode(response.body));
      print(browseMoviesModel.results);
      return browseMoviesModel;
    } else {
      throw Exception("failed to load movies");
    }
  }

}
