import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/model/flight.dart';

abstract class StopOverApi {
  Future<List<Category>> getCategories();

  Future<List<Poi>> getPois(String categoryId);

  Future<Flight> getFlightInfo();
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
        .get("https://us-central1-stopover-app-api.cloudfunctions.net/poisByCategoryId?categoryId=$categoryId");

    if (response.statusCode != 200) {
      throw (response.body);
    }

    return (json.decode(response.body) as List)
        .map((model) => Poi.fromJson(model))
        .toList();
  }

  @override
  Future<Flight> getFlightInfo() async {
    final response = await http
        .get("https://us-central1-stopover-app-api.cloudfunctions.net/flight");

    if (response.statusCode != 200) {
      throw (response.body);
    }

    return Flight.fromJson(json.decode(response.body));
  }
}

final stopOverApi = StopOverApiImpl();
