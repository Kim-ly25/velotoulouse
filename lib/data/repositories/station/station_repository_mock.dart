

import 'package:velotoulouse/data/repositories/station/station_repository.dart';
import 'package:velotoulouse/model/station/station_model.dart';

class StationRepositoryMock implements StationRepository{
  final List<Station> _stations = [
    Station(
      id: "104",
      stationDock: "Dock A",
    ),
    Station(
      id: "204",
      stationDock: "Dock B",
    ),
    Station(
      id: "304",
      stationDock: "Dock C",
    ),
    Station(
      id: "404",
      stationDock: "Dock D",
    ),
    Station(
      id: "504",
      stationDock: "Dock E",
    ),
  ];

  @override
  Future<List<Station>> fetchStations() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _stations;
    });
  }
}