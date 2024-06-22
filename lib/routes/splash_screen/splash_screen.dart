import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/utils/app_colors.dart';

class SplashScreen extends StatelessWidget{
 const SplashScreen({super.key}) ;


 @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then(
      (x){
        print("Data here.............");
        Navigator.pushNamed(context, RouteGenerator.homeScren);
      } );
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img.jpeg"))
            ),
          ),
        )
        // Column(
        //   children: [
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image(image: AssetImage("assets/images/icon.jpg")),
        //           SizedBox(height: 10,),
        //           Text("Guider", style: AppStyle.bigTitleStyle,)
        //         ],
        //       )),
        //     SizedBox(
        //       child: Row(

        //       ),
        //     )
        //   ],
        // )
        ),
    );
  }
}