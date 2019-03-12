import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';

abstract class StopOverApi {
  Future<List<Category>> getCategories();

  Future<List<Poi>> getPois(String categoryId);
}

class StopOverApiImpl implements StopOverApi {
  @override
  Future<List<Category>> getCategories() async {
    final response = await http.get(
        "https://us-central1-stopover-app-api.cloudfunctions.net/categories");

    if (response.statusCode != 200) {
      throw (response.body);
    }

    return (json.decode(response.body) as List)
        .map((model) => Category.fromJson(model))
        .toList();
  }

  @override
  Future<List<Poi>> getPois(String categoryId) async {
    final response = await http
        .get("https://us-central1-stopover-app-api.cloudfunctions.net/pois");

    if (response.statusCode != 200) {
      throw (response.body);
    }

    return (json.decode(response.body) as List)
        .map((model) => Poi.fromJson(model))
        .toList();
  }
}

final stopOverApi = StopOverApiImpl();
