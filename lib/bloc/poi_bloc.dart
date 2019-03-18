import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class PoiBloc {
  final StopOverRepository _repository = repository;
  final PublishSubject<List<Poi>> _allPoiFetcher = PublishSubject<List<Poi>>();
  final PublishSubject<List<String>> _favouriteIdsFetcher = PublishSubject<List<String>>();
  final PublishSubject<List<Poi>> _favouritePoisFetcher = PublishSubject<List<Poi>>();

  Observable<List<Poi>> get allPois => _allPoiFetcher.stream;

  Observable<List<String>> get favouriteIds => _favouriteIdsFetcher.stream;

  Observable<List<Poi>> get favouritePois => _favouritePoisFetcher.stream;

  void fetchAllPois(String categoryId) async {
    final List<Poi> pois = await _repository.fetchPois(categoryId);
    _allPoiFetcher.sink.add(pois);
  }

  void fetchFavouritePois() async {
    final List<Poi> pois = await _repository.favouritePOIs();
    _favouritePoisFetcher.sink.add(pois);
  }

  void fetchFavouriteIds() async {
    final List<String> ids = await _repository.favouriteIds();
    _favouriteIdsFetcher.sink.add(ids);
  }
  
  void putFavourite(String poiId, bool isFavourite) async {
    _repository.putFavouritePoi(poiId, isFavourite);
  }

  void dispose() {
    _allPoiFetcher.close();
    _favouriteIdsFetcher.close();
    _favouritePoisFetcher.close();
  }
}

final PoiBloc poiBloc = PoiBloc();
