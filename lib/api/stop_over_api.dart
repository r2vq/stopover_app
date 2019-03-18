import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/flight.dart';
import 'package:stopover_app/model/poi.dart';

abstract class StopOverApi {
  Future<List<Category>> getCategories();

  Future<List<Poi>> getPois(String categoryId);

  Future<Flight> getFlightInfo();

  Future<List<Poi>> getPoisByIds(List<String> poiIds);
}

class StopOverApiImpl implements StopOverApi {
  @override
  Future<List<Category>> getCategories() async {
    final http.Response response = await http.get(
        'https://us-central1-stopover-app-api.cloudfunctions.net/categories');

    if (response.statusCode != 200) {
      throw response.body;
    }

    return (json.decode(response.body) as List)
        .map((dynamic model) => Category.fromJson(model))
        .toList();
  }

  @override
  Future<List<Poi>> getPois(String categoryId) async {
    final http.Response response = await http.get(
        'https://us-central1-stopover-app-api.cloudfunctions.net/poisByCategoryId?categoryId=$categoryId');

    if (response.statusCode != 200) {
      throw response.body;
    }

    return (json.decode(response.body) as List)
        .map((dynamic model) => Poi.fromJson(model))
        .toList();
  }

  @override
  Future<List<Poi>> getPoisByIds(List<String> poiIds) async {
    final http.Response response = await http.get(
        "https://us-central1-stopover-app-api.cloudfunctions.net/poisByIds?ids=${poiIds.join(",")}");

    if (response.statusCode != 200) {
      throw response.body;
    }

    return (json.decode(response.body) as List)
        .map((dynamic model) => Poi.fromJson(model))
        .toList();
  }

  @override
  Future<Flight> getFlightInfo() async {
    final http.Response response = await http
        .get('https://us-central1-stopover-app-api.cloudfunctions.net/flight');

    if (response.statusCode != 200) {
      throw (response.body);
    }

    return Flight.fromJson(json.decode(response.body));
  }
}

final stopOverApi = StopOverApiImpl();
