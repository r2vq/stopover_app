import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/model/flight.dart';

void main() {

  test('should convert from json string to flight info', () {
    const JSON_STRING =
        '{"terminal":"3","boarding_time":"1552752000","departure_time":"1552755600","start_airport":"YYZ","flight_no":"EK 456","gate":"D30","destination_airport":"DXB"}';

    Flight flightInfo = Flight.fromJson(json.decode(JSON_STRING));

    expect("EK 456", flightInfo.flightNo);
    expect("3", flightInfo.terminal);
    expect("D30", flightInfo.gate);
    expect("YYZ", flightInfo.startAirport);
    expect("DXB", flightInfo.destinationAirport);
  });
}
