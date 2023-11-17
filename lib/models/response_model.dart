import 'movie_model.dart';

class ResponseModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  ResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      page: json['page'],
      results:
          (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
