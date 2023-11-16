import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:movie/core/constants.dart';
import 'package:movie/model/home_view_mode/details_movie_model.dart';
import 'package:movie/model/home_view_mode/more_like_model.dart';
import 'package:movie/model/home_view_mode/new_releases_model.dart';
import 'package:movie/model/home_view_mode/popular_movie_model.dart';
import 'package:movie/model/home_view_mode/recommended_model.dart';


class HomeApiManager {
  static Future<PopularMovieModel> fetchPopularMovie() async {
    Map<String, dynamic>? queryParameters = {
      "api_key": Constants.apiKey,
    };
    Uri uri =
    Uri.https(Constants.basUlrHome, "/3/movie/popular", queryParameters);
    final response = await https.get(uri);
    if (response.statusCode == 200) {
      var popularModel = PopularMovieModel.fromJson(jsonDecode(response.body));
      return popularModel;
    } else {
      throw Exception("failed to load movie");
    }
  }

  static Future<NewReleasesModel> fetchNewReleases() async {
    Map<String, dynamic>? queryParameters = {
      "api_key": Constants.apiKey,
    };
    Uri uri =
    Uri.https(Constants.basUlrHome, "/3/movie/upcoming", queryParameters);
    final response = await https.get(uri);
    if (response.statusCode == 200) {
      var newReleasesModel =
      NewReleasesModel.fromJson(jsonDecode(response.body));
      return newReleasesModel;
    } else {
      throw Exception("failed to load new releases");
    }
  }

  static Future<RecommendedModel> fetchRecommended() async {
    Map<String, dynamic>? queryParameters = {"api_key": Constants.apiKey};

    Uri uri =
    Uri.https(Constants.basUlrHome, "/3/movie/top_rated", queryParameters);
    final response = await https.get(uri);
    if (response.statusCode == 200) {
      var recommendedModel =
      RecommendedModel.fromJson(jsonDecode(response.body));
      return recommendedModel;
    } else {
      throw Exception("failed to load new recommend");
    }
  }

  static Future<DetailsMovieModel> fetchDetailsMovie(String id) async {
    Map<String, dynamic>? queryParameters = {"api_key": Constants.apiKey};
    Uri uri =
    Uri.https(Constants.basUlrHome, "/3/movie/${id}", queryParameters);
    final response = await https.get(uri);
    if (response.statusCode == 200) {
      var detailsMovieModel =
      DetailsMovieModel.fromJson(jsonDecode(response.body));
      return detailsMovieModel;
    } else {
      throw Exception("failed to load details");
    }
  }

  static Future<MoreLikeModel> fetchMoreLike(String id) async {
    Map<String, dynamic>? queryParameters = {"api_key": Constants.apiKey};
    Uri uri = Uri.https(
        Constants.basUlrHome, "/3/movie/${id}/similar", queryParameters);
    final response = await https.get(uri);
    if (response.statusCode == 200) {
      var moreLikeModel = MoreLikeModel.fromJson(jsonDecode(response.body));
      return moreLikeModel;
    } else {
      throw Exception("failed to load more like");
    }
  }
}
