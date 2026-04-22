import '../../../model/bike/bike_slot.dart';
import 'bike_slot_repository.dart';


class BikeSlotRepositoryMock implements BikeSlotRepository {
  final List<BikeSlot> _slots = const [
    BikeSlot(id: '#1023', stationName: 'Dock A', isAvailable: true),
    BikeSlot(id: '#1024', stationName: 'Dock B', isAvailable: true),
    BikeSlot(id: '#1025', stationName: 'Dock C', isAvailable: true),
    BikeSlot(id: '#1026', stationName: 'Dock D', isAvailable: true),
    BikeSlot(id: '#1027', stationName: 'Dock E', isAvailable: true),
  ];

  @override
  Future<List<BikeSlot>> fetchSlots() async {
    return Future.delayed(const Duration(milliseconds: 800), () => _slots);
  }
}
