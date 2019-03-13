import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/flight.dart';
import 'package:stopover_app/model/poi.dart';

class StopOverRepository {
  static const String SHARED_PREFERENCE_KEY_FAVOURITE_POIS =
      "shared_preference_key_favourite_pois";

  final StopOverApi _api;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  StopOverRepository(this._api);

  Future<List<Category>> fetchCategories() async {
    return _api.getCategories();
  }

  Future<List<Poi>> fetchPois(String categoryId) async {
    return _api.getPois(categoryId);
  }

  Future<Flight> fetchFlightInfo() async {
    return _api.getFlightInfo();
  }

  Future<List<Poi>> fetchPoisByIds(List<String> poiIds) async {
    return _api.getPoisByIds(poiIds);
  }

  Future<List<String>> favouritePois() async {
    List<String> favourites =
        (await _prefs).getStringList(SHARED_PREFERENCE_KEY_FAVOURITE_POIS);
    if (favourites == null) {
      favourites = List<String>();
    }
    return favourites;
  }

  void putFavouritePoi(String poiId, bool isFavourite) async {
    List<String> favourites = await favouritePois();
    if (isFavourite) {
      favourites.add(poiId);
    } else {
      favourites.remove(poiId);
    }
    (await _prefs)
        .setStringList(SHARED_PREFERENCE_KEY_FAVOURITE_POIS, favourites);
  }

  Future<bool> isFavourite(String poiId) async {
    return (await _prefs)
        .getStringList(SHARED_PREFERENCE_KEY_FAVOURITE_POIS)
        .contains(poiId);
  }
}

StopOverRepository _repository;

StopOverRepository get repository {
  if (_repository == null) {
    _repository = StopOverRepository(stopOverApi);
  }
  return _repository;
}
