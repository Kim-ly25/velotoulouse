enum PaymentMethod { pass, singleTicket }

class Booking {
  final String id;
  final String userId;
  final String slotId;
  final String dockId;
  final String stationId;
  final String stationName;
  final DateTime createdAt;
  final PaymentMethod paymentMethod;
  final String? passId;

  const Booking({
    required this.id,
    required this.userId,
    required this.slotId,
    required this.dockId,
    required this.stationId,
    required this.stationName,
    required this.createdAt,
    required this.paymentMethod,
    this.passId,
  });
}

/// Holds the selected slot across navigation (pass selection flow)
class BookingSession {
  final String slotId;
  final String dockId;
  final String stationId;
  final String stationName;

  const BookingSession({
    required this.slotId,
    required this.dockId,
    required this.stationId,
    required this.stationName,
  });
}