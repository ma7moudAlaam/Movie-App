import 'package:movie/core/constants.dart';

class WatchListModel {
  String image;
  String title;
  String date;
  String originalTitle;
  String id;

  WatchListModel(
      {required this.image,
      required this.title,
      required this.date,
        required this.id,
      required this.originalTitle});

  factory WatchListModel.fromFireStore(Map<String, dynamic> json) {
    return WatchListModel(
      id: json["id"],
        image: json["image"],
        title: json["title"],
        date: json["date"],
        originalTitle: json["original_title"]);
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id":id,
      "image": "${Constants.basicImage}$image",
      "title": title,
      "date": date,
      "original_title": originalTitle
    };
  }
}
