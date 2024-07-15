import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../modal/detail_modal.dart';
import '../modal/home_card_modal/home_card_modal.dart';

class JsoncardProvider extends ChangeNotifier {
  List dataList = [];
  List<Planetcardmodal> userList = [];

  JsoncardProvider() {
    print('--------------------- data called ----------------');
    jsonParsing();
    print('--------------------- Done ----------------');
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/home_screen_planet_list/list.json');
    dataList = jsonDecode(json);

    userList = dataList.map((e) => Planetcardmodal.fromJson(e)).toList();

    print(userList);
    notifyListeners();
  }
}

class JsonDetailProvider  extends ChangeNotifier {
  List dataList = [];
  List<Planet> userList = [];

  JsonDetailProvider() {
    print('--------------------- data called ----------------');
    jsonParsing();
    print('--------------------- Done ----------------');
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/planet_list/planet_list.json');
    dataList = jsonDecode(json);

    userList = dataList.map((e) => Planet.fromJson(e)).toList();

    print(userList);
    notifyListeners();
  }
}