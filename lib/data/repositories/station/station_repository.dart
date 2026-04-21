import '../../../model/station/station_model.dart';

abstract class StationRepository {
  Future<List<Station>> fetchStations();
}