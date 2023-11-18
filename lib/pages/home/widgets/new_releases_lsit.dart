import 'package:flutter/material.dart';


import 'package:movie/model/home_view_mode/new_releases_model.dart';
import 'package:movie/pages/home/widgets/new_releases_item.dart';

class NewReleasesList extends StatelessWidget {
  const NewReleasesList({super.key, required this.newReleasesList});

  final List<ResultsNewReleases> newReleasesList;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme=Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: mediaQuery.height * 0.01,
        left: mediaQuery.width * 0.04,
      ),
      height: mediaQuery.height * 0.215,
      width: mediaQuery.width,
      color: const Color(0xFF282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "New Releases ",
            style: theme.textTheme.titleSmall,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    NewReleasesItem(results: newReleasesList[index]),
                itemCount: newReleasesList.length),
          )
        ],
      ),
    );
  }
}
