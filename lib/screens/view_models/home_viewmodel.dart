import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsfeed_app/screens/api/fetch_news_api.dart';
import 'package:newsfeed_app/screens/api/main_categorie_api.dart';
import 'package:newsfeed_app/screens/models/main_categorie_model.dart';
import 'package:newsfeed_app/screens/models/new_list_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<BlogsCategory> mainCategorisList = [];
  List<Result> allNewList = [];
  List<Result> testList = [];
  List<Result> investingList = [];
  List<Result> stockList = [];
  List<Result> learningList = [];
  List<Result> brandingList = [];
  List<Result> cryptoList = [];

  getMainCategorie() async {
    final result = await MainCategoriApi.getMainCatogorie();
    mainCategorisList.clear();
    mainCategorisList = result.blogsCategory;
    notifyListeners();
  }

  getMoreNews() async {
    final result = await FetchNewsApi.getMoreNews("0");
    allNewList = result.results;
    notifyListeners();
    log(allNewList.toString());
  }

  getNewsList(String tabValue) async {
    if (tabValue == "0") {
      final result = await FetchNewsApi.getNewList("0");
      allNewList = result.results;
    } else if (tabValue == "1") {
      final result = await FetchNewsApi.getNewList("10");
      testList = result.results;
    } else if (tabValue == "2") {
      final result = await FetchNewsApi.getNewList("9");
      investingList = result.results;
    } else if (tabValue == "3") {
      final result = await FetchNewsApi.getNewList("6");
      stockList = result.results;
    } else if (tabValue == "4") {
      final result = await FetchNewsApi.getNewList("4");
      learningList = result.results;
    } else if (tabValue == "5") {
      final result = await FetchNewsApi.getNewList("3");
      brandingList = result.results;
    } else if (tabValue == "6") {
      final result = await FetchNewsApi.getNewList("2");
      cryptoList = result.results;
    }
    notifyListeners();
  }
}
