import 'package:flutter/foundation.dart';
import 'package:velotoulouse/model/booking/booking_model.dart';
import 'package:velotoulouse/model/station/slot_model.dart';
import 'package:velotoulouse/model/station/station_model.dart';
import 'package:velotoulouse/model/subscription/pass_model.dart';

class AppState extends ChangeNotifier {
  // --- User ---
  final String userId = 'user_001';
  Pass? _activePass;

  Pass? get activePass => _activePass;
  bool get hasValidPass => _activePass != null && _activePass!.isValid;

  // --- Stations & Slots ---
  late List<Station> _stations;
  List<Station> get stations => _stations;

  // --- Bookings ---
  final List<Booking> _bookings = [];
  List<Booking> get bookings => _bookings;

  // --- Booking Session (preserved across pass purchase flow) ---
  BookingSession? _pendingSession;
  BookingSession? get pendingSession => _pendingSession;

  AppState() {
    _stations = _buildMockStations();
  }

  // ── Pass ──────────────────────────────────────────────────
  void purchasePass(PassOption option) {
    final now = DateTime.now();
    _activePass = Pass(
      id: 'pass_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: option.type,
      price: option.price,
      purchasedAt: now,
      expiresAt: now.add(option.duration),
    );
    notifyListeners();
  }

  // ── Booking Session ───────────────────────────────────────
  void startBookingSession(Slot slot) {
    _pendingSession = BookingSession(
      slotId: slot.slotId,
      dockId: slot.dockId,
      stationId: slot.stationId,
      stationName: slot.stationName,
    );
    notifyListeners();
  }

  void clearBookingSession() {
    _pendingSession = null;
    notifyListeners();
  }

  // ── Confirm Booking ───────────────────────────────────────
  Booking? confirmBooking({required PaymentMethod method}) {
    if (_pendingSession == null) return null;

    final session = _pendingSession!;

    final booking = Booking(
      id: 'booking_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      slotId: session.slotId,
      dockId: session.dockId,
      stationId: session.stationId,
      stationName: session.stationName,
      createdAt: DateTime.now(),
      // status: BookingStatus.confirmed,
      paymentMethod: method,
      passId: method == PaymentMethod.pass ? _activePass?.id : null,
    );

    _bookings.add(booking);

    // Mark slot as unavailable
    _markSlotBooked(session.slotId, booking.id);

    _pendingSession = null;
    notifyListeners();
    return booking;
  }

  void _markSlotBooked(String slotId, String bookingId) {
    _stations = _stations.map((station) {
      final updatedSlots = station.slots.map((slot) {
        if (slot.slotId == slotId) {
          return slot.copyWith(hasBike: false, bookingId: bookingId);
        }
        return slot;
      }).toList();
      return Station(id: station.id, name: station.name, slots: updatedSlots);
    }).toList();
  }

  // ── Mock Data ─────────────────────────────────────────────
  List<Station> _buildMockStations() {
    return [
      Station(
        id: 'station_a',
        name: 'Complete Station A',
        slots: [
          const Slot(slotId: 'Slot #1022', dockId: 'DOCK-A', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock A', hasBike: true),
          const Slot(slotId: 'Slot #1023', dockId: 'DOCK-B', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock B', hasBike: true),
          const Slot(slotId: 'Slot #1024', dockId: 'DOCK-C', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock C', hasBike: true),
          const Slot(slotId: 'Slot #1025', dockId: 'DOCK-D', stationId: 'station_a', stationName: 'Complete Station A', dockLabel: 'Dock D', hasBike: false),
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
  }
}
