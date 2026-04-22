import 'package:velotoulouse/model/bike/bike_slot.dart';

class BikeSlotDto {
  static const String idKey = 'id';
  static const String stationNameKey = 'stationName';
  static const String isAvailableKey = 'isAvailable';

  static BikeSlot fromJson(Map<String, dynamic> json) {
    assert(json[idKey] is String);
    assert(json[stationNameKey] is String);
    assert(json[isAvailableKey] is bool);

    return BikeSlot(
      id: json[idKey],
      stationName: json[stationNameKey],
      isAvailable: json[isAvailableKey],
    );
  }

  static Map<String, dynamic> toJson(BikeSlot slot) {
    return {
      idKey: slot.id,
      stationNameKey: slot.stationName,
      isAvailableKey: slot.isAvailable,
    };
  }
}
