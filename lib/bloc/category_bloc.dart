import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class CategoryBloc {
  final _repository = StopOverRepository();
  final _fetcher = PublishSubject<List<Category>>();

  Observable<List<Category>> get allCategories => _fetcher.stream;

  fetchAllCategories() async {
    List<Category> categories = await _repository.fetchCategories();
    _fetcher.sink.add(categories);
  }

  dispose() {
    _fetcher.close();
  }
}

final bloc = CategoryBloc();
