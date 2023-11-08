import 'dart:ffi';

import 'package:flutter/material.dart';

import '../details_view/details_view.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {super.key,
      required this.bookmarkVisible,
      required this.id,
      required this.title,
      required this.heightImage,
      required this.imageNetwork,
      required this.widthImage});

  final String imageNetwork;
  final double heightImage;
  final double widthImage;
  final String title;
  final String id;
  final bool bookmarkVisible;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(
                title: title,
                id: id,
              ),
            ));
      },
      child: bookmarkVisible == true
          ? Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    imageNetwork,
                    height: heightImage,
                    width: widthImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: const Alignment(0, -0.5),
                      children: [
                        Image.asset(
                          "assets/icons/Icon awesome-bookmark.png",
                          color: const Color(0xff514F4F),
                        ),
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageNetwork,
                height: heightImage,
                width: widthImage,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
