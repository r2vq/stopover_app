import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/model/category.dart';

void main() {
  test('should convert from json string to list of Categories', () {
    const JSON_STRING =
        '[{"name":"shops","image_url":"https://loremflickr.com/cache/resized/4862_44514950700_e544949c39_320_240_nofilter.jpg","id":"20002"}]';

    List<Category> categoryList = (json.decode(JSON_STRING) as List)
        .map((dynamic model) => Category.fromJson(model))
        .toList();

    expect(1, categoryList.length);
    expect("20002", categoryList[0].id);
    expect("shops", categoryList[0].name);
    expect(
        "https://loremflickr.com/cache/resized/4862_44514950700_e544949c39_320_240_nofilter.jpg",
        categoryList[0].imageUrl);
  });
}
