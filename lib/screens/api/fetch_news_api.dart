import 'dart:convert';
import 'dart:developer';

import 'package:newsfeed_app/screens/models/new_list_model.dart';
import 'package:http/http.dart' as http;

class FetchNewsApi {
  static Future<NewListModel> getNewList(String categorieId) async {
    try {
      final response = await http.post(
          Uri.parse(
              "https://milliondotsadmin.noviindus.co.in/api/news-and-blogs-catg"),
          body: {
            "category": categorieId,
          });
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return NewListModel.fromJson(jsonDecode(response.body));
      } else {
        throw 'something went wrong !';
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }

  static Future<NewListModel> getMoreNews(String categorieId) async {
    try {
      final response = await http.post(
          Uri.parse(
              "https://milliondotsadmin.noviindus.co.in/api/news-and-blogs-catg?page=2"),
          body: {
            "category": categorieId,
          });
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return NewListModel.fromJson(jsonDecode(response.body));
      } else {
        throw 'something went wrong !';
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }
}
