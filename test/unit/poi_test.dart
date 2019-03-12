import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/model/poi.dart';

void main() {
  test('should convert from json string to list of POIs', () {
    const JSON_STRING =
        '[{"description":"hamburgers","image_url":"http://placekitten.com/181/100","category_id":"20001","name":"Mcdonald\'s","end_time":"1552413600","start_time":"1552400000","id":"10002","map_url":"http://geekhmer.github.io/images/google_map_draggable_maker.png"}]';

    List<Poi> poiList = (json.decode(JSON_STRING) as List)
        .map((model) => Poi.fromJson(model))
        .toList();

    expect(1, poiList.length);
    expect("Mcdonald's", poiList[0].name);
    expect("hamburgers", poiList[0].description);
    expect("http://placekitten.com/181/100", poiList[0].imageUrl);
  });
}
