// Bike is represented by its slot/dock location.
// We don't track bike by bike ID — only by slot ID and dock ID.
class Bike {
  final String id;
  final String slotId;
  final String dockId;
  final String stationId;

  const Bike({
    required this.id,
    required this.slotId,
    required this.dockId,
    required this.stationId,
  });
}
