import '../bike/bike_slot.dart';
import '../pass/pass_plan.dart';


class Booking {
  final BikeSlot slot;
  final PassPlan plan;
  final DateTime startDate;
  final DateTime expiryDate;

  const Booking({
    required this.slot,
    required this.plan,
    required this.startDate,
    required this.expiryDate,
  });

}
