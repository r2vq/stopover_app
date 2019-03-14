import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class PoiBloc {
  final _repository = repository;
  final _allPoiFetcher = PublishSubject<List<Poi>>();
  final _favouriteIdsFetcher = PublishSubject<List<String>>();
  final _favouritePoisFetcher = PublishSubject<List<Poi>>();

  Observable<List<Poi>> get allPois => _allPoiFetcher.stream;

  Observable<List<String>> get favouriteIds => _favouriteIdsFetcher.stream;

  Observable<List<Poi>> get favouritePois => _favouritePoisFetcher.stream;

  fetchAllPois(String categoryId) async {
    List<Poi> pois = await _repository.fetchPois(categoryId);
    _allPoiFetcher.sink.add(pois);
  }

  fetchFavouritePois() async {
    List<Poi> pois = await _repository.favouritePOIs();
    _favouritePoisFetcher.sink.add(pois);
  }

  fetchFavourites() async {
    List<String> ids = await _repository.favouriteIds();
    _favouriteIdsFetcher.sink.add(ids);
  }
  
  putFavourite(String poiId, bool isFavourite) async {
    _repository.putFavouritePoi(poiId, isFavourite);
  }

  dispose() {
    _allPoiFetcher.close();
    _favouriteIdsFetcher.close();
    _favouritePoisFetcher.close();
  }
}

final poiBloc = PoiBloc();
