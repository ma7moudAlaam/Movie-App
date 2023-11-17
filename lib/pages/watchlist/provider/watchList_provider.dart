import 'package:flutter/material.dart';
import 'package:movie/core/network_layer/firestore_utils.dart';
import 'package:movie/model/watch_list_model/watch_list_model.dart';

class WatchListProvider extends ChangeNotifier {
  List<WatchListModel> _watchList = [];

  List<WatchListModel> get watchList => _watchList;
  bool saved = false;
  WatchListModel? watchListModel;

  Future<void> getwatchList() async {
    _watchList = await FireStoreUtils.getDataFromFireStore();
    notifyListeners();
  }

  save(bool save) {
    saved = save;
    notifyListeners();
  }

  deleteFromFireStore(WatchListModel watchListModel) async {
    await FireStoreUtils.deleteDataFromFireStore(watchListModel);
    notifyListeners();
  }

  checkId(String id, List<WatchListModel> list, bool sav) {
    for (int i = 0; i <= list.length; i++) {
      if (id == list[i].id) {
        print(list[i].id);
        return sav = saved;
      }
      return saved;
    }
  }
}
