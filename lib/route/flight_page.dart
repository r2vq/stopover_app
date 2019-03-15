import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/flight_bloc.dart';
import 'package:stopover_app/model/flight.dart';

class FlightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    flightBloc.fetchFlightInfo();
    return StreamBuilder<Flight>(
        stream: flightBloc.flightInfo,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? _createFlightUi(snapshot.data)
              : CircularProgressIndicator();
        });
  }

  Widget _createFlightUi(Flight flight) {
    return Semantics(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(6),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _createFlightHeader(flight),
                    _createFlightImage(flight),
                    _createFlightInfo(flight),
                    _createQRCodeUI()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createFlightHeader(Flight flight) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _createLargeText(flight.flightNo, textColor: Colors.white),
          _createLargeText(flight.flightName, textColor: Colors.white)
        ],
      ),
    );
  }

  Widget _createFlightImage(Flight flight) {
    return Image.network(
      flight.flightImage,
      fit: BoxFit.fill,
      height: 200.0,
    );
  }

  Widget _createFlightInfo(Flight flight) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _createFlightLocation(flight),
          _createFlightTime(flight),
        ],
      ),
    );
  }

  Widget _createFlightLocation(Flight flight) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _createMediumText('Boarding starts in '),
              _createMediumText(flight.boardingTime, textColor: Colors.green),
            ],
          ),
          _createStartDestinationUI(flight)
        ],
      ),
    );
  }

  Widget _createStartDestinationUI(Flight flight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _createFlightCard(flight.departureAirport, flight.departureTerminal,
            flight.departureGate),
        Icon(Icons.flight_takeoff),
        _createFlightCard(
            flight.arrivalAirport, flight.arrivalTerminal, flight.arrivalGate),
      ],
    );
  }

  Widget _createFlightTime(Flight flight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _createMediumText("Departure"),
              _createMediumText("Arrival")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _createLargeText(flight.departureTime, textColor: Colors.red),
              _createLargeText(flight.arrivalTime, textColor: Colors.red)
            ],
          ),
        ],
      ),
    );
  }

  Widget _createFlightCard(String airportCode, String terminal, String gate) {
    return Card(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _createLargeText(airportCode, textColor: Colors.red),
            _createMediumText('Terminal $terminal'),
            _createMediumText('Gate $gate'),
          ],
        ),
      ),
    );
  }

  Widget _createLargeText(String text, {Color textColor = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: textColor,
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget _createMediumText(String text, {Color textColor = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: textColor,
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget _createQRCodeUI() {
    return Container(
      height: 200.0,
      child: Image.asset(
        'assets/images/qr-code.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
