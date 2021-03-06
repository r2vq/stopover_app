import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class CategoryBloc {
  final _repository = repository;
  final _fetcher = PublishSubject<List<Category>>();

  Observable<List<Category>> get allCategories => _fetcher.stream;

  void fetchAllCategories() async {
    final List<Category> categories = await _repository.fetchCategories();
    _fetcher.sink.add(categories);
  }

  void dispose() {
    _fetcher.close();
  }
}

final CategoryBloc categoryBloc = CategoryBloc();
