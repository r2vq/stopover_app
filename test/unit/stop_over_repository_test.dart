import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

void main() {
  test('test /fetchCategories', () async {
    final stopOverRepository = StopOverRepository();
    final categories = await stopOverRepository.fetchCategories();
    for (var category in categories) {
      expect(category.id, hasLength(greaterThan(0)));
      expect(category.name, hasLength(greaterThan(0)));
      expect(category.imageUrl, hasLength(greaterThan(0)));
    }
  });

  test('test /fetchPois', () async {
    final stopOverRepository = StopOverRepository();
    final pois = await stopOverRepository.fetchPois("1");
    for (var poi in pois) {
      expect(poi.name, hasLength(greaterThan(0)));
      expect(poi.imageUrl, hasLength(greaterThan(0)));
      expect(poi.description, hasLength(greaterThan(0)));
    }
  });
}
