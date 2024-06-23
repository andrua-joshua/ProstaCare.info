import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/bloc/repository/user_repository_base/user_respository_api.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/all_articles_screen/all_articles_screen.dart';
import 'package:sample_app/routes/all_bookings_screen/all_bookings_screen.dart';
import 'package:sample_app/routes/all_doctors_screen/all_doctors_screen.dart';
import 'package:sample_app/routes/all_groups_screen/all_groups_screen.dart';
import 'package:sample_app/routes/assesment_screen/assesment_screen.dart';
import 'package:sample_app/routes/home_screen/home_screen.dart';
import 'package:sample_app/routes/login_screen/login_screen.dart';
import 'package:sample_app/routes/patient_signup_screen/patient_signup_screen.dart';
import 'package:sample_app/routes/read_articles_screen/read_articles_screen.dart';
import 'package:sample_app/routes/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(UserRespositoryApi()))
      ],
      builder:(context, child) => const MyApp(),)
  );
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
      // home: const ReadArticlesScreen(),
    );
  }
}
