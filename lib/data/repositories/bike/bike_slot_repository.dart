import '../../../model/bike/bike_slot.dart';


abstract class BikeSlotRepository {
  Future<List<BikeSlot>> fetchSlots();
}
