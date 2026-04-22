import '../../../model/booking/booking.dart';
import '../../../model/bike/bike_slot.dart';
import '../../../model/pass/pass_plan.dart';


abstract class BookingRepository {
  Future<Booking> confirmBooking({
    required BikeSlot slot,
    required PassPlan plan,
  });
}
