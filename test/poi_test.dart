import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/model/poi.dart';

void main() {
  test('should convert from json string to list of POIs', () {
    const JSON_STRING =
        '[{ "description":"pizza", "category_id":"20001", "discount":"Free Guac!", "image_url":"https://firebasestorage.googleapis.com/v0/b/stopover-app-api.appspot.com/o/pois%2Ffood%2Fdominos_pizza.jpeg?alt=media&token=a9ddcb0d-a430-4e19-b52e-45e6a8b22acc", "name":"Dominos", "marker_long":"-79.6248", "end_time":"1552680000", "marker_lat":"43.6777", "map_url":"https://firebasestorage.googleapis.com/v0/b/stopover-app-api.appspot.com/o/pois%2Fdummy_map.png?alt=media&token=a2b73ddf-ce0f-46b0-8206-932ab2f4b9b6", "start_time":"1552658400", "id":"10003" }]';

    List<Poi> poiList = (json.decode(JSON_STRING) as List)
        .map((dynamic model) => Poi.fromJson(model))
        .toList();

    expect(1, poiList.length);
    expect("Dominos", poiList[0].name);
    expect("pizza", poiList[0].description);
    expect("Free Guac!", poiList[0].discount);
    expect("https://firebasestorage.googleapis.com/v0/b/stopover-app-api.appspot.com/o/pois%2Ffood%2Fdominos_pizza.jpeg?alt=media&token=a9ddcb0d-a430-4e19-b52e-45e6a8b22acc", poiList[0].imageUrl);
    expect("43.6777", poiList[0].markerLatPosition);
    expect("-79.6248", poiList[0].markerLongPosition);
  });
}
