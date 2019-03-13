import 'package:rxdart/rxdart.dart';
import 'package:stopover_app/api/stop_over_api.dart';
import 'package:stopover_app/model/flight.dart';
import 'package:stopover_app/repository/stop_over_repository.dart';

class FlightBloc {
  final _repository = StopOverRepository(stopOverApi);
  final _fetcher = PublishSubject<Flight>();

  Observable<Flight> get flightInfo => _fetcher.stream;

  fetchFlightInfo() async {
    Flight flightInfo = await _repository.fetchFlightInfo();
    _fetcher.sink.add(flightInfo);
  }

  dispose() {
    _fetcher.close();
  }
}

final flightBloc = FlightBloc();
