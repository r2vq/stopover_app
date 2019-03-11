import 'package:stopover_app/model/category.dart';

class StopOverRepository {
  Future<List<Category>> fetchCategories() async {
    return [
      Category("1", "Keane",
          "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg"),
      Category("2", "Denesh",
          "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg"),
      Category("3", "Liz",
          "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png"),
    ];
  }
}
