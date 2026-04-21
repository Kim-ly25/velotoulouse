import 'package:velotoulouse/data/repositories/station/station_repository.dart';
import 'package:velotoulouse/model/station/slot_model.dart';
import 'package:velotoulouse/model/station/station_model.dart';

class StationRepositoryMock implements StationRepository {
  final List<Station> _stations = [
    Station(
      id: 'station_a',
      name: 'Complete Station A',
      slots: [
        const Slot(slotId: 'Slot #1022', dockId: 'DOCK-A', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock A', hasBike: true),
        const Slot(slotId: 'Slot #1023', dockId: 'DOCK-B', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock B', hasBike: true),
        const Slot(slotId: 'Slot #1024', dockId: 'DOCK-C', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock C', hasBike: true),
        const Slot(slotId: 'Slot #1025', dockId: 'DOCK-D', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock D', hasBike: false),
        const Slot(slotId: 'Slot #1026', dockId: 'DOCK-E', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock E', hasBike: true),
      ],
    ),
    Station(
      id: 'station_b',
      name: 'Complete Station B',
      slots: [
        const Slot(slotId: 'Slot #2001', dockId: 'DOCK-A', stationId: 'station_b', stationName: 'Complete Station B', dockLabel: 'Dock A', hasBike: true),
        const Slot(slotId: 'Slot #2002', dockId: 'DOCK-B', stationId: 'station_b', stationName: 'Complete Station B', dockLabel: 'Dock B', hasBike: false),
      ],
    ),
  ];

  @override
  List<Station> getStations() => _stations;

  @override
  Slot? getSlot(String slotId) {
    for (final station in _stations) {
      for (final slot in station.slots) {
        if (slot.slotId == slotId) return slot;
      }
    }
    return null;
  }
}
