import 'package:flutter/material.dart';
import 'package:movie/pages/browse/browse_view.dart';
import 'package:movie/pages/home/home_view.dart';
import 'package:movie/pages/search/search_view.dart';
import 'package:movie/pages/watchlist/watchlist_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static String routName = "homelayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectIndex = 0;
  List screens = [HomeView(), SearchView(), BrowseView(), WatchListView()];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
          currentIndex: selectIndex,
          mouseCursor: MouseCursor.defer,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: "HOME",
                icon: ImageIcon(
                  AssetImage("assets/icons/Home icon.png"),
                )),
            BottomNavigationBarItem(
                label: "SEARCH",
                icon: ImageIcon(
                  AssetImage("assets/icons/search-icon.png"),
                )),
            BottomNavigationBarItem(
                label: "Browse",
                icon: ImageIcon(
                  AssetImage("assets/icons/browse_icon.png"),
                )),
            BottomNavigationBarItem(
                label: "Watchlist",
                icon: ImageIcon(
                  AssetImage("assets/icons/watchlist-icon.png"),
                )),
          ]),
      body: screens[selectIndex],
    );
  }
}
