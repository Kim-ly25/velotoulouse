import 'package:flutter/widgets.dart';

import '../../model/bike/bike_slot.dart';
import '../../model/booking/booking.dart';
import '../../model/pass/pass_plan.dart';

/// Global state that carries selections through the booking flow:
///   screen-1 (select slot) → screen-2 (slot detail) →
///   screen-3 (choose plan) → screen-4 (pay)         →
///   screen-5/6 (success).

class BookingState extends ChangeNotifier {
  BikeSlot? _selectedSlot;
  PassPlan? _selectedPlan;
  Booking? _confirmedBooking;
  bool _hasActivePass = false;
  final Set<String> _removedSlotIds = <String>{};

  BikeSlot? get selectedSlot => _selectedSlot;
  PassPlan? get selectedPlan => _selectedPlan;
  Booking? get confirmedBooking => _confirmedBooking;
  bool get hasActivePass => _hasActivePass;
  Set<String> get removedSlotIds => Set.unmodifiable(_removedSlotIds);

  // Called when the user taps a bike slot on screen-1.
  void selectSlot(BikeSlot slot) {
    _selectedSlot = slot;
    _removedSlotIds.add(slot.id);
    notifyListeners();
  }

  // Called when the user chooses a plan on screen-3.
  void selectPlan(PassPlan plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  // Called once pass payment succeeds on screen-4.
  void activatePass(PassPlan plan) {
    _selectedPlan = plan;
    _hasActivePass = true;
    notifyListeners();
  }

  // Called once payment is confirmed on screen-4.
  void setConfirmedBooking(Booking booking) {
    _confirmedBooking = booking;
    notifyListeners();
  }

  // Called after a successful bike unlock when user returns to booking.
  // Keeps active pass so they can unlock another bike during pass validity.
  void clearCurrentRideKeepPass() {
    _selectedSlot = null;
    _confirmedBooking = null;
    notifyListeners();
  }

  // Reset the flow (e.g. after "Back to Booking" on success screen).
  void reset() {
    _selectedSlot = null;
    _selectedPlan = null;
    _confirmedBooking = null;
    _hasActivePass = false;
    _removedSlotIds.clear();
    notifyListeners();
  }
}
