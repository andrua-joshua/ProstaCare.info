import 'package:flutter/material.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/assesment_screen/assesment_screen.dart';
import 'package:sample_app/routes/home_screen/home_screen.dart';
import 'package:sample_app/routes/login_screen/login_screen.dart';
import 'package:sample_app/routes/patient_signup_screen/patient_signup_screen.dart';
import 'package:sample_app/routes/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prostate cancer',
      theme: ThemeData(
            fontFamily: "Lufga",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const AssesmentScreen(),
    );
  }
}
