import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class MockApi extends Mock implements StopOverApi {}

void main() {
  Future<List<Category>> fakeCategories = _makeFakeCategories();
  Future<List<Poi>> fakePois = _makeFakePois();
  String fakeCategoryId = "1";

  test('test /fetchCategories', () async {
    var mockApi = MockApi();
    final stopOverRepository = StopOverRepository(mockApi);

    when(mockApi.getCategories()).thenAnswer((_) async => fakeCategories);

    final categories = await stopOverRepository.fetchCategories();
    expect(categories.length, 3);
    expect(categories[0].id, "1");
    expect(categories[0].name, "Shops");
    expect(categories[0].imageUrl,
        "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg");
  });

  test('test /fetchPois', () async {
    var mockApi = MockApi();
    final stopOverRepository = StopOverRepository(mockApi);

    when(mockApi.getPois(fakeCategoryId)).thenAnswer((_) async => fakePois);

    final pois = await stopOverRepository.fetchPois(fakeCategoryId);
    expect(pois.length, 3);
    expect(pois[0].name, "Tim Hortons");
    expect(pois[0].imageUrl,
        "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg");
    expect(pois[0].description, "Something about Tim Hortons");
  });
}

Future<List<Category>> _makeFakeCategories() async {
  return [
    Category("1", "Shops",
        "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg"),
    Category("2", "Services",
        "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg"),
    Category("3", "Food",
        "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png"),
  ];
}

Future<List<Poi>> _makeFakePois() async {
  return [
    Poi(
      "Tim Hortons",
      "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg",
      "Something about Tim Hortons",
      "http://geekhmer.github.io/images/google_map_draggable_maker.png",
    ),
    Poi(
      "KFC",
      "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg",
      "Something about KFC",
      "http://geekhmer.github.io/images/google_map_draggable_maker.png",
    ),
    Poi(
      "Wendy's",
      "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png",
      "Something about Wendy's",
      "http://geekhmer.github.io/images/google_map_draggable_maker.png",
    ),
  ];
}
