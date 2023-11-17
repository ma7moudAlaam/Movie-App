import 'package:movie/model/watch_list_model/watch_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUtils {
  static CollectionReference<WatchListModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("WatchListCollection")
        .withConverter<WatchListModel>(
          fromFirestore: (snapshot, _) =>
              WatchListModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future addDataToFireStore(WatchListModel watchListModel) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    watchListModel.id = docRef.id;
    return docRef.set(watchListModel);
  }

  static Stream<QuerySnapshot<WatchListModel>> getDataRealTimeFromFireStore() {
    var snapshot = getCollection().snapshots();
    return snapshot;
  }

  static Future<List<WatchListModel>> getDataFromFireStore() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Future<void> deleteDataFromFireStore(WatchListModel  watchListModel) {
    var collectionRef = getCollection();
    return collectionRef.doc(watchListModel.id).delete();
  }

}
