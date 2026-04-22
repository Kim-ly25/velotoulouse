import 'package:flutter/widgets.dart';

import '../../model/bike/bike_slot.dart';
import '../../model/booking/booking.dart';
import '../../model/pass/pass_plan.dart';

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

  void selectSlot(BikeSlot slot) {
    _selectedSlot = slot;
    _removedSlotIds.add(slot.id);
    notifyListeners();
  }

  void selectPlan(PassPlan plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  void activatePass(PassPlan plan) {
    _selectedPlan = plan;
    _hasActivePass = true;
    notifyListeners();
  }

  void setConfirmedBooking(Booking booking) {
    _confirmedBooking = booking;
    notifyListeners();
  }

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
