import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bookmark extends ChangeNotifier {
  void changeBookmark(String link) {
    final bookmarkdata = Hive.box('bookmarks');

    if (bookmarkdata.containsKey(link)) {
      bookmarkdata.delete(link);
    } else {
      bookmarkdata.put(
        link,
        true,
      ); //here the key is the link and the value is true
    }
    notifyListeners();
  }
}
