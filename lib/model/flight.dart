class Flight {
  final String _flightNo;
  final String _flightName;
  final String _flightImage;
  final String _arrivalAirport;
  final String _departureAirport;
  final String _arrivalTerminal;
  final String _departureTerminal;
  final String _arrivalGate;
  final String _departureGate;
  final String _departureTime;
  final String _arrivalTime;
  final String _boardingTime;


  Flight(this._flightNo, this._flightName, this._flightImage,
      this._arrivalAirport, this._departureAirport, this._arrivalTerminal,
      this._departureTerminal, this._arrivalGate, this._departureGate,
      this._departureTime, this._arrivalTime, this._boardingTime);

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    json['flight_no'] as String,
    json['flight_name'] as String,
    json['flight_image'] as String,
    json['arrival_airport'] as String,
    json['departure_airport'] as String,
    json['arrival_terminal'] as String,
    json['departure_terminal'] as String,
    json['arrival_gate'] as String,
    json['departure_gate'] as String,
    json['arrival_time'] as String,
    json['departure_time'] as String,
    json['boarding_time'] as String,
  );

  String get flightNo => _flightNo;

  String get flightName => _flightName;

  String get flightImage => _flightImage;

  String get arrivalAirport => _arrivalAirport;

  String get departureAirport => _departureAirport;

  String get arrivalTerminal => _arrivalTerminal;

  String get departureTerminal => _departureTerminal;

  String get arrivalGate => _arrivalGate;

  String get departureGate => _departureGate;

  String get boardingTime => _boardingTime;

  String get arrivalTime => _arrivalTime;

  String get departureTime => _departureTime;
}