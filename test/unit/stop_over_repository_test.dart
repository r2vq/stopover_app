import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class MockApi extends Mock implements StopOverApi {}
class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  Future<List<Category>> fakeCategories = _makeFakeCategories();
  Future<List<Poi>> fakePois = _makeFakePois();
  String fakeCategoryId = "1";

  test('test /fetchCategories', () async {
    var mockApi = MockApi();
    final stopOverRepository = StopOverRepository(mockApi, _getMockSharedPrefs());

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
    final stopOverRepository = StopOverRepository(mockApi, _getMockSharedPrefs());

    when(mockApi.getPois(fakeCategoryId)).thenAnswer((_) async => fakePois);

    final pois = await stopOverRepository.fetchPois(fakeCategoryId);
    expect(pois.length, 3);
    expect(pois[0].name, "Tim Hortons");
    expect(pois[0].imageUrl,
        "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg");
    expect(pois[0].discount, "2 for 1");
    expect(pois[0].description, "Something about Tim Hortons");
    expect(pois[0].endTime, "17:00");
    expect(pois[0].startTime, "12:00");
    expect(pois[0].categoryId, "1");
    expect(pois[0].markerLatPosition, "200.0");
    expect(pois[0].markerLongPosition, "-456.34");
  });
}

Future<SharedPreferences> _getMockSharedPrefs() async {
  return MockSharedPrefs();
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
      "2 for 1",
      "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg",
      "Something about Tim Hortons",
      "1",
      "17:00",
      "12:00",
      "1",
      "200.0",
      "-456.34",
    ),
    Poi(
      "KFC",
      "2 for 1",
      "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg",
      "Something about KFC",
      "2",
      "18:00",
      "13:00",
      "1",
      "200.0",
      "-456.34",
    ),
    Poi(
      "Wendy's",
      "2 for 1",
      "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png",
      "Something about Wendy's",
      "3",
      "19:00",
      "14:00",
      "1",
      "200.0",
      "-456.34",
    ),
  ];
}
