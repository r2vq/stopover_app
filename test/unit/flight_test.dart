import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stopover_app/model/flight.dart';

void main() {

  test('should convert from json string to flight info', () {
    const JSON_STRING =
        '{"departure_terminal":"3","boarding_time":"2 hours","arrival_terminal":"5","flight_no":"EK 456","departure_airport":"YYZ","flight_name":"Emirates Airlines","flight_image":"https://firebasestorage.googleapis.com/v0/b/stopover-app-api.appspot.com/o/emirates_flight.jpeg?alt=media&token=118a229f-bcb0-4b95-9958-888a35370c7a","departure_time":"02:00 PM","arrival_gate":"E24","arrival_time":"10:00 AM","arrival_airport":"DXB","departure_gate":"D30"}';
    Flight flightInfo = Flight.fromJson(json.decode(JSON_STRING));

    expect("EK 456", flightInfo.flightNo);
    expect("Emirates Airlines", flightInfo.flightName);
    expect("https://firebasestorage.googleapis.com/v0/b/stopover-app-api.appspot.com/o/emirates_flight.jpeg?alt=media&token=118a229f-bcb0-4b95-9958-888a35370c7a", flightInfo.flightImage);
    expect("5", flightInfo.arrivalTerminal);
    expect("3", flightInfo.departureTerminal);
    expect("E24", flightInfo.arrivalGate);
    expect("D30", flightInfo.departureGate);
    expect("DXB", flightInfo.arrivalAirport);
    expect("YYZ", flightInfo.departureAirport);
    expect("02:00 PM", flightInfo.arrivalTime);
    expect("10:00 AM", flightInfo.departureTime);
    expect("2 hours", flightInfo.boardingTime);
  });
}
