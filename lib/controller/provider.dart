import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/detail_screen_modal/detail_modal.dart';

class JsonDetailProvider  extends ChangeNotifier {
  List dataList = [];
  List<Planet> userList = [];
  List<Planet> bookmarkedList = [];

  JsonDetailProvider() {
    print('--------------------- data called ----------------');
    jsonParsing();
    _loadBookmarkedPlanets();
    _saveBookmarkedPlanets();
    print('--------------------- Done ----------------');
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/home_screen_planet_list/list.json');
    dataList = jsonDecode(json);

    userList = dataList.map((e) => Planet.fromJson(e)).toList();

    print(userList);
    notifyListeners();
  }
  Future<void> _loadBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedPlanets = prefs.getStringList('bookmarkedPlanets');

    if (bookmarkedPlanets != null) {
      bookmarkedList = userList
          .where((planet) => bookmarkedPlanets.contains(planet.name))
          .toList();
      print('done');
      notifyListeners();
    }
  }

  Future<void> _saveBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedPlanets =
    bookmarkedList.map((planet) => planet.name).toList();
    await prefs.setStringList('bookmarkedPlanets', bookmarkedPlanets);
  }

  void toggleBookmark(Planet planet) {
    if (bookmarkedList.contains(planet)) {
      bookmarkedList.remove(planet);
      print("remove");
    } else {
      bookmarkedList.add(planet);
      print("add");
    }
    _loadBookmarkedPlanets();
    _saveBookmarkedPlanets();
    notifyListeners();
  }

}


