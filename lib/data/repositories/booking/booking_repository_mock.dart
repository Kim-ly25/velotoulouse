import 'package:velotoulouse/data/repositories/booking/booking_repository.dart';
import 'package:velotoulouse/model/booking/booking_model.dart';

class BookingRepositoryMock implements BookingRepository {
  final List<Booking> _bookings = [];

  @override
  List<Booking> getBookings(String userId) =>
      _bookings.where((b) => b.userId == userId).toList();

  @override
  Booking addBooking(Booking booking) {
    _bookings.add(booking);
    return booking;
  }
}