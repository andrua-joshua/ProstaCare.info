import 'package:sample_app/bloc/modules/booking_module.dart';

abstract interface class BookingsRespositoryBase{

  ///
  ///add booking
  ///delete booking
  ///get booking by patient
  ///get booking by doctor
  ///get all bookings
  ///update booking status
  ///
  

  Future<int> createBooking({
    required String token,
    required BookingModule bookingModule
  });

  Future<int> deleteBooking({
    required String token,
    required int bookingId
  });

  Future<List<BookingModule>> getAllBookings({
    required String token
  });

  Future<List<BookingModule>> getBookingsByDoctor({
    required String token,
    required int doctorId
  });

  Future<List<BookingModule>> getBookingsByPatient({
    required String token,
    required int patientId
  });

  
}