import 'slot.dart';

class Station {
  final String id;
  final String name;
  final List<Slot> slots;

  const Station({
    required this.id,
    required this.name,
    required this.slots,
  });

  List<Slot> get availableSlots => slots.where((s) => s.hasBike).toList();
  bool get hasAvailableBikes => availableSlots.isNotEmpty;
}