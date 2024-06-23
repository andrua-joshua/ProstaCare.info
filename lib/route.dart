import 'package:flutter/material.dart';
import 'package:sample_app/routes/account_details_screen/account_details_screen.dart';
import 'package:sample_app/routes/all_articles_screen/all_articles_screen.dart';
import 'package:sample_app/routes/all_bookings_screen/all_bookings_screen.dart';
import 'package:sample_app/routes/all_doctors_screen/all_doctors_screen.dart';
import 'package:sample_app/routes/all_groups_screen/all_groups_screen.dart';
import 'package:sample_app/routes/all_patients_screen/all_patients_screen.dart';
import 'package:sample_app/routes/assesment_screen/assesment_screen.dart';
import 'package:sample_app/routes/home_screen/home_screen.dart';
import 'package:sample_app/routes/login_screen/login_screen.dart';
import 'package:sample_app/routes/patient_signup_screen/patient_signup_screen.dart';
import 'package:sample_app/routes/read_articles_screen/read_articles_screen.dart';
import 'package:sample_app/routes/splash_screen/splash_screen.dart';

class RouteGenerator{

  static const String splashScreen = "/";
  static const String loginScreen = "/loginScreen";
  static const String patientSignupScreen = "/patientSignupScreen";
  static const String homeScren ="/homeScreen";
  static const String accountDetailsScreen ="/accountDetailsScreen";
  static const String assesmentScreen ="/assesmentScreen";
  static const String allBookingsScreen ="/allBookingsScreen";
  static const String allGroupsScreen ="/allGroupsScreen";
  static const String allArticlesScreen ="/allArticlesScreen";
  static const String allDoctorsScreen ="/allDoctorsScreen";
  static const String allPatientsScreen ="/allPatientsScreen";

  static const String readArticlesScreen ="/readArticlesScreen";


  static Route<dynamic> generateRoute (RouteSettings settings){
    switch(settings.name){
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(
          builder: (_)=> const LoginScreen());

      case allBookingsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AllBookingsScreen());

      case readArticlesScreen:
        return MaterialPageRoute(
          builder: (_)=> const ReadArticlesScreen());

      case allGroupsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AllGroupsScreen());

      case allArticlesScreen:
        return MaterialPageRoute(
          builder: (_)=> const AllArticlesScreen());

      case allDoctorsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AllDoctorsScreen());

      case patientSignupScreen:
        return MaterialPageRoute(
          builder: (_)=> const PatientSignupScreen() );

      case homeScren:
        return MaterialPageRoute(
          builder: (_)=> const HomeScreen() );

      case accountDetailsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AccountDetailsScreen() );

      case assesmentScreen:
        return MaterialPageRoute(
          builder: (_)=> const AssesmentScreen() );
      
      case allPatientsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AllPatientsScreen() );

      default:
        return MaterialPageRoute(
          builder: (_)=> const SplashScreen());
    }
  }
}