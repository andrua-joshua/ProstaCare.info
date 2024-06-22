import 'package:flutter/material.dart';
import 'package:sample_app/routes/account_details_screen/account_details_screen.dart';
import 'package:sample_app/routes/home_screen/home_screen.dart';
import 'package:sample_app/routes/login_screen/login_screen.dart';
import 'package:sample_app/routes/patient_signup_screen/patient_signup_screen.dart';
import 'package:sample_app/routes/splash_screen/splash_screen.dart';

class RouteGenerator{

  static const String splashScreen = "/";
  static const String loginScreen = "/loginScreen";
  static const String patientSignupScreen = "/patientSignupScreen";
  static const String homeScren ="/homeScreen";
  static const String accountDetailsScreen ="/accountDetailsScreen";

  static Route<dynamic> generateRoute (RouteSettings settings){
    switch(settings.name){
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(
          builder: (_)=> const LoginScreen());
      case patientSignupScreen:
        return MaterialPageRoute(
          builder: (_)=> const PatientSignupScreen() );

      case homeScren:
        return MaterialPageRoute(
          builder: (_)=> const HomeScreen() );

      case accountDetailsScreen:
        return MaterialPageRoute(
          builder: (_)=> const AccountDetailsScreen() );

      default:
        return MaterialPageRoute(
          builder: (_)=> const SplashScreen());
    }
  }
}