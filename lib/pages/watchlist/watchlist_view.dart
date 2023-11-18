import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/network_layer/firestore_utils.dart';
import 'package:movie/model/watch_list_model/watch_list_model.dart';

import 'package:movie/pages/watchlist/provider/watchList_provider.dart';

import '../home/details_view/details_view.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  late WatchListProvider viewModel;

  @override
  void initState() {
    viewModel = WatchListProvider();
    viewModel.getwatchList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQuery.width * 0.04,
          right: mediaQuery.width * 0.04,
          top: 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Watchlist",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<WatchListModel>>(
            stream: FireStoreUtils.getDataRealTimeFromFireStore(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.refresh))
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.primary,
                  ),
                );
              }
              var watchList = snapshot.data?.docs
                      .map((element) => element.data())
                      .toList() ??
                  [];
              return ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => WatchListItem(
                  model: watchList[index],
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.white,
                  height: 30,
                  thickness: 0.75,
                ),
                itemCount: watchList.length,
              );
            },
          ))
        ],
      ),
    );
  }
}

class WatchListItem extends StatelessWidget {
  const WatchListItem({
    super.key,
    required this.model,
  });

  final WatchListModel model;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      width: mediaQuery.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(
                          title: model.title,
                          id: model.id,
                        ),
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    model.image,
                    height: 89,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await FireStoreUtils.deleteDataFromFireStore(model);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: const Alignment(0, -0.5),
                      children: [
                        Image.asset("assets/icons/Icon awesome-bookmark.png",
                            color: theme.colorScheme.primary),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                model.title,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                model.date,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: Color(0xFF707070)),
              ),
              Text(
                model.originalTitle.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: Color(0xFF707070)),
              )
            ],
          )
        ],
      ),
    );
  }
}
