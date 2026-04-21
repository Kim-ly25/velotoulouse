import 'package:velotoulouse/model/booking/booking_model.dart';

abstract class BookingRepository {
  List<Booking> getBookings(String userId);
  Booking addBooking(Booking booking);
}


