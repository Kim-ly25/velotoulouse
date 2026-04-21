import 'package:velotoulouse/data/repositories/booking/booking_repository.dart';
import 'package:velotoulouse/model/booking/booking_model.dart';

class BookingRepositoryMock implements BookingRepository{
  final List<Booking> _bookings = [];

  @override
  Future<List<Booking>> fetchBookings() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _bookings;
    });
  }
  
  @override
  Future<void> setBookings(Booking booking) async {
    _bookings.add(booking);
  }
}