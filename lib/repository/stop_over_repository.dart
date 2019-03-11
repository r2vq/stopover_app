import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';

class StopOverRepository {
  Future<List<Category>> fetchCategories() async {
    return [
      Category("1", "Shops",
          "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg"),
      Category("2", "Services",
          "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg"),
      Category("3", "Food",
          "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png"),
    ];
  }

  Future<List<Poi>> fetchPois(String categoryId) async {
    String url;

    switch (categoryId) {
      case "1":
        url = "http://fluttercrashcourse.com/assets/images/fuji@3x.jpg";
        break;
      case "2":
        url = "http://fluttercrashcourse.com/assets/images/arashiyama@3x.jpg";
        break;
      case "3":
      default:
        url =
            "http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png";
        break;
    }

    return [
      Poi("Tim Hortons", url, "Something about Tim Hortons"),
      Poi("KFC", url, "Something about KFC"),
      Poi("Wendy's", url, "Something about Wendy's"),
    ];
  }
}
