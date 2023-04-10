import 'dart:convert';
import 'dart:developer';
import 'package:newsfeed_app/screens/models/main_categorie_model.dart';
import 'package:http/http.dart' as http;

class MainCategoriApi {
  static Future<MainCategorieModel> getMainCatogorie() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://milliondotsadmin.noviindus.co.in/api/news-and-blogs"),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 202) {
        return MainCategorieModel.fromJson(jsonDecode(response.body));
      } else {
        throw 'something went wrong !';
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }
}
