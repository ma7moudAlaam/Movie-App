import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.028),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        "assets/images/movie.png",
                        fit: BoxFit.cover,
                      )),
                  Image.asset("assets/images/bookmark.png"),
                ],
              ),
              SizedBox(
                width: mediaQuery.width * 0.028,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alita Battle Angel",
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Text(
                    "2019",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Text(
                    "Rosa Salazar, Christoph Waltz",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: mediaQuery.height * 0.035,
        ),
      ],
    );
  }
}
