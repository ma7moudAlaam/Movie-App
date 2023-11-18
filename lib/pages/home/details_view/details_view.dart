import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/constants.dart';

import 'package:movie/pages/home/details_view/widgets/details_movie_item.dart';
import 'package:movie/pages/home/details_view/widgets/more_like_list.dart';
import 'package:movie/pages/home/provider/details_provider.dart';

import 'package:provider/provider.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
    required this.title,
    required this.id,
  });

  static String routName = "Deails_view";
  final String title;
  final String id;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsProvider viewModel;

  @override
  void initState() {
    viewModel = DetailsProvider();
    Future.wait([viewModel.getDetailsMovie(widget.id)]).then((value) {
      if (value[0] == true) {
        return viewModel.gatMoreLikeList(viewModel.idList.toString());
      }
    });

    viewModel.getDetailsMovie(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFF1D1E1D),
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<DetailsProvider>(
            builder: (context, vm, child) {
              if (vm.apiSuccess == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        "${Constants.basicImage}${vm.posterPath}",
                        height: mediaQuery.height * 0.235,
                        width: mediaQuery.width,
                        fit: BoxFit.cover,
                      ),
                      const ImageIcon(
                        AssetImage("assets/icons/icon_display_popular.png"),
                        size: 55,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: mediaQuery.height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vm.title.toString(),
                            style: theme.textTheme.titleMedium),
                        SizedBox(
                          height: mediaQuery.height * 0.001,
                        ),
                        Text(vm.releaseDate.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 10,
                                color: const Color(0xFFB5B4B4),
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: mediaQuery.height * 0.01),
                    child: DetailsMovieItem(
                        id: "",
                        date: vm.releaseDate.toString(),
                        title: vm.title.toString(),
                        originalTitle: vm.title.toString(),
                        genres: vm.genresList,
                        rate: vm.voteAverage!.toDouble(),
                        description: vm.overview.toString(),
                        imageNetwork:
                            "${Constants.basicImage}${vm.posterPath}"),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: mediaQuery.height * 0.01),
                    child: MoreLikeList(
                      moreLikeList: vm.moreLikeList ?? [],
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
