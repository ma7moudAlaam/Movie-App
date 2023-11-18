import 'package:flutter/material.dart';
import 'package:movie/model/browse_view_model/browse_category_mode.dart';
import 'package:movie/pages/browse/provider/browse_view_provide.dart';
import 'package:provider/provider.dart';

import 'browse_movies_view.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  late BrowseProvider viewModel;

  @override
  void initState() {
    viewModel = BrowseProvider();
    viewModel.getCategoryList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<BrowseProvider>(
        builder: (context, value, child) {
          if (viewModel.apiSuccess == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.only(
                left: mediaQuery.width * 0.04,
                right: mediaQuery.width * 0.04,
                top: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Browse Category",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 6,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: viewModel.categoryList.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          listMoviesModel: viewModel.categoryList[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.listMoviesModel});

  final Genres listMoviesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BrowseFilmView(
              id: listMoviesModel.id ?? 0,
              title: listMoviesModel.name.toString(),
            );
          },
        ));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage("assets/images/image category.png"))),
        child: Text(
          listMoviesModel.name.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
