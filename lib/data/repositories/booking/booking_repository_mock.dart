import '../../../model/bike/bike_slot.dart';
import '../../../model/booking/booking.dart';
import '../../../model/pass/pass_plan.dart';
import 'booking_repository.dart';

class BookingRepositoryMock implements BookingRepository {
  @override
  Future<Booking> confirmBooking({
    required BikeSlot slot,
    required PassPlan plan,
  }) async {
    return Future.delayed(const Duration(milliseconds: 1000), () {
      final now = DateTime.now();
      final expiry = plan.type == PassType.daily
          ? now.add(const Duration(hours: 24))
          : plan.type == PassType.monthly
          ? now.add(const Duration(days: 30))
          : now.add(const Duration(days: 365));
        return Booking(
          slot: slot,
          plan: plan,
          startDate: now,
          expiryDate: expiry,
        );
      }
    );
  }
}
