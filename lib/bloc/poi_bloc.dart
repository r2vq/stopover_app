import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class PoiBloc {
  final _repository = repository;
  final _allPoiFetcher = PublishSubject<List<Poi>>();
  final _poiByIdsFetcher = PublishSubject<List<Poi>>();

  Observable<List<Poi>> get allPois => _allPoiFetcher.stream;

  Observable<List<Poi>> get poisByIds => _poiByIdsFetcher.stream;

  fetchAllPois(String categoryId) async {
    List<Poi> pois = await _repository.fetchPois(categoryId);
    _allPoiFetcher.sink.add(pois);
  }

  fetchPoisById(List<String> poiIds) async {
    List<Poi> pois = await _repository.fetchPoisByIds(poiIds);
    _poiByIdsFetcher.sink.add(pois);
  }

  dispose() {
    _allPoiFetcher.close();
    _poiByIdsFetcher.close();
  }
}

final poiBloc = PoiBloc();
