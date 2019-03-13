import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/model/flight.dart';

class StopOverRepository {

  final StopOverApi _api;

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
}

StopOverRepository _repository;

StopOverRepository get repository {
  if (_repository == null) {
    _repository = StopOverRepository(stopOverApi);
  }
  return _repository;
}
