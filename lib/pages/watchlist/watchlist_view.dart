import 'package:flutter/material.dart';
import 'package:movie/pages/watchlist/watchlist_item.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: mediaQuery.width * 0.028,
        left: mediaQuery.width * 0.028,
        top: mediaQuery.height * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Watchlist",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            height: mediaQuery.height * 0.028,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, build) => const WatchListItem(),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
