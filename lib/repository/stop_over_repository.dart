import 'package:stopover_app/model/category.dart';

class StopOverRepository {
  Future<List<Category>> fetchCategories() async {
    return [
      Category("1", "Keane",
          "https://avatars3.githubusercontent.com/u/3311081?s=400&v=4"),
      Category("2", "Denesh",
          "https://avatars1.githubusercontent.com/u/5783814?s=460&v=4")
    ];
  }
}
