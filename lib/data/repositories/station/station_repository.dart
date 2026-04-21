import 'package:velotoulouse/model/station/slot_model.dart';
import 'package:velotoulouse/model/station/station_model.dart';

abstract class StationRepository {
  List<Station> getStations();
  Slot? getSlot(String slotId);
}

