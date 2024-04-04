import 'package:get/get.dart';

class SearchAppController extends GetxController {
  RxList<String> searchHistory = <String>[].obs;

  void addSearchHistory(String query) {
    searchHistory.add(query);
  }

  void clearSearchHistory() {
    searchHistory.clear();
  }

  void removeSearchHistory(String query) {
    searchHistory.remove(query);
  }

  void clearLastSearchHistory() {
    if (searchHistory.isNotEmpty) {
      searchHistory.removeLast();
    }
  }
}
