import 'package:flutter/foundation.dart';
import 'package:sample_app/bloc/repository/bookings_repository/bookings_respository_base.dart';

class BookingProvider with ChangeNotifier{

  BookingProvider._(BookingsRespositoryBase bookingRepository): bookingRepo = bookingRepository;
  factory BookingProvider(BookingsRespositoryBase bookingRepository) => BookingProvider._(bookingRepository);


  final BookingsRespositoryBase bookingRepo;

  void notifyAll() => notifyListeners();  
}