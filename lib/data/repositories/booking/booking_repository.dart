import '../../../model/booking/booking_model.dart';

abstract class BookingRepository {
  Future<List<Booking>> fetchBookings();
  Future<void> setBookings(Booking booking);
}