import 'dart:convert';

import 'package:sample_app/bloc/modules/booking_module.dart';
import 'package:sample_app/bloc/repository/bookings_repository/bookings_respository_base.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class BookingsRepositoryApi implements BookingsRespositoryBase{


  @override
  Future<int> createBooking({
    required String token, 
    required BookingModule bookingModule}) async{
      final uri = Uri.parse(AppConstants.createBooking);
      final Map<String, dynamic> payload = {
        "patient_id": bookingModule.patientId,
        "doctor_id": bookingModule.doctorId,
        "session_date": bookingModule.sessionDate
      };


      try{

        final res = await http.post(
          uri,
          headers: {
            "Authorization": token,
          },
          body: payload
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Making booking successful.............  ${res.body}");
          return 1;
        }else if(res.statusCode == 401){
          print("User not authorized ...     ${res.body}");
          return -1;
        }else{
          print("Failed to make the booking ...     ${res.body}");
          return -2;
        }

      }catch(err){
        print("Error making the booking....    $err");
        return -5;
      }
    
  }

  @override
  Future<int> deleteBooking({
    required String token, 
    required int bookingId}) async{
      final uri = Uri.parse("${AppConstants.deleteBooking}$bookingId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Booking deleted successfully......... ${res.body}");
          return 1;
        }else if(res.statusCode == 404){
          print("Booking item not found......... ${res.body}");
          return 0;
        }else if(res.statusCode == 401){
          print("user unauthorized......... ${res.body}");
          return -1;
        }else{
          return -2;
        }

      }catch(err){
        print("Error deleting the booking:.....    $err");
        return -5;
      }
    
  }

  @override
  Future<List<BookingModule>> getAllBookings({required String token}) async{
      final uri = Uri.parse(AppConstants.getAllBookings);

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Bookings fetched successfully......... ${res.body}");
          List<BookingModule> bookings = [];
          final data = jsonDecode(res.body)["Bookings"] as List<dynamic>;
          for(var item in data){
            bookings.add(BookingModule.fromJson(item));
          }

          return bookings;

        }else if(res.statusCode == 404){
          print("Booking item not found......... ${res.body}");
          return [];
        }else if(res.statusCode == 401){
          print("user unauthorized......... ${res.body}");
          return [];
        }else{
          print("Failed to get bookings......... ${res.body}");
          return [];
        }

      }catch(err){
        print("Error deleting the booking:.....    $err");
        return [];
      }
    
  }

  @override
  Future<List<BookingModule>> getBookingsByDoctor({
    required String token, required int doctorId}) async{
    final uri = Uri.parse("${AppConstants.getBookingByDoctor}$doctorId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Bookings fetch successfully......... ${res.body}");
          List<BookingModule> bookings = [];
          final data = jsonDecode(res.body)["Bookings"] as List<dynamic>;
          for(var item in data){
            bookings.add(BookingModule.fromJson(item));
          }

          return bookings;

        }else if(res.statusCode == 404){
          print("Booking item not found......... ${res.body}");
          return [];
        }else if(res.statusCode == 401){
          print("user unauthorized......... ${res.body}");
          return [];
        }else{
          print("Failed to get bookings......... ${res.body}");
          return [];
        }

      }catch(err){
        print("Error deleting the booking:.....    $err");
        return [];
      }
  }

  @override
  Future<List<BookingModule>> getBookingsByPatient({
    required String token, required int patientId}) async{
    final uri = Uri.parse("${AppConstants.getBookingByPatient}$patientId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Bookings fetch successfully......... ${res.body}");
          List<BookingModule> bookings = [];
          final data = jsonDecode(res.body)["Bookings"] as List<dynamic>;
          for(var item in data){
            bookings.add(BookingModule.fromJson(item));
          }

          return bookings;

        }else if(res.statusCode == 404){
          print("Booking item not found......... ${res.body}");
          return [];
        }else if(res.statusCode == 401){
          print("user unauthorized......... ${res.body}");
          return [];
        }else{
          print("Failed to get bookings......... ${res.body}");
          return [];
        }

      }catch(err){
        print("Error deleting the booking:.....    $err");
        return [];
      }
  }

  
}