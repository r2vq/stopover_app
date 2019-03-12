class Flight {
  final String _flightNo;
  final String _startAirport;
  final String _destinationAirport;
  final String _terminal;
  final String _gate;

  Flight(this._flightNo, this._startAirport, this._destinationAirport,
      this._terminal, this._gate);

  String get gate => _gate;

  String get terminal => _terminal;

  String get destinationAirport => _destinationAirport;

  String get startAirport => _startAirport;

  String get flightNo => _flightNo;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    json['flight_no'] as String,
    json['start_airport'] as String,
    json['destination_airport'] as String,
    json['terminal'] as String,
    json['gate'] as String
  );
}