import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';

class StopOverRepository {

  final StopOverApi _api;

  StopOverRepository(this._api);

  Future<List<Category>> fetchCategories() async {
    return _api.getCategories();
  }

  Future<List<Poi>> fetchPois(String categoryId) async {
    return _api.getPois(categoryId);
  }
}