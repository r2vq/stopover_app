import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class PoiBloc {
  final _repository = StopOverRepository();
  final _fetcher = PublishSubject<List<Poi>>();

  Observable<List<Poi>> get allPois => _fetcher.stream;

  fetchAllPois(String categoryId) async {
    List<Poi> pois = await _repository.fetchPois(categoryId);
    _fetcher.sink.add(pois);
  }

  dispose() {
    _fetcher.close();
  }
}

final poiBloc = PoiBloc();
