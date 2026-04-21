import 'package:flutter/material.dart';
import 'package:velotoulouse/model/booking/booking_model.dart';
import 'package:velotoulouse/model/station/slot_model.dart';
import 'package:velotoulouse/ui/states/app_state.dart';

class BookingViewModel extends ChangeNotifier {
  final AppState appState;

  BookingViewModel({required this.appState});

  List<Slot> get availableSlots => appState.stations
      .expand((station) => station.slots)
      .where((slot) => slot.isAvailable)
      .toList();

  bool get hasPass => appState.hasValidPass;

  BookingSession? get session => appState.pendingSession;

  void selectSlot(Slot slot) {
    appState.startBookingSession(slot);
    notifyListeners();
  }

  Booking? confirmWithPass() {
    return appState.confirmBooking(method: PaymentMethod.pass);
  }

  Booking? buyTicket() {
    return appState.confirmBooking(method: PaymentMethod.singleTicket);
  }
}
