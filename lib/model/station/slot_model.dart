class Slot {
  final String slotId;    // "Slot #1022"
  final String dockId;    // "DOCK-A"
  final String stationId;
  final String stationName;
  final String dockLabel; // "Dock A"
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

  Slot copyWith({
    String? slotId,
    String? dockId,
    String? stationId,
    String? stationName,
    String? dockLabel,
    bool? hasBike,
    String? bookingId,
  }) {
    return Slot(
      slotId: slotId ?? this.slotId,
      dockId: dockId ?? this.dockId,
      stationId: stationId ?? this.stationId,
      stationName: stationName ?? this.stationName,
      dockLabel: dockLabel ?? this.dockLabel,
      hasBike: hasBike ?? this.hasBike,
      bookingId: bookingId ?? this.bookingId,
    );
  }
}
