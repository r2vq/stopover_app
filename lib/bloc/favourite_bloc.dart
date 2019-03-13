import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class FavouriteBloc {
  final _repository = repository;
  final _favourites = PublishSubject<List<String>>();

  Observable<List<String>> get favourites => _favourites.stream;

  fetchFavourites() async =>
      _favourites.sink.add(await _repository.favouritePois());

  putFavourite(String poiId, bool isFavourite) async =>
      _repository.putFavouritePoi(poiId, isFavourite);

  dispose() {
    _favourites.close();
  }
}

FavouriteBloc favouriteBloc = FavouriteBloc();