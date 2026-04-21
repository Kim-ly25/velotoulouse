class Slot {
  final String slotId;    // e.g. "Slot #1022"
  final String dockId;    // e.g. "DOCK-A"
  final String stationId;
  final String stationName;
  final String dockLabel; // e.g. "Dock A"
  final bool hasBike;
  final String? bookingId;

  const Slot({
    required this.slotId,
    required this.dockId,
    required this.stationId,
    required this.stationName,
    required this.dockLabel,
    required this.hasBike,
    this.bookingId,
  });

  bool get isAvailable => hasBike && bookingId == null;
}