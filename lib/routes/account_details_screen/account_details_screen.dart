import 'package:flutter/material.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class AccountDetailsScreen extends StatefulWidget{
  const AccountDetailsScreen({super.key});

  @override
  _accountDetailsScreenState createState () => _accountDetailsScreenState();

}


class _accountDetailsScreenState extends State<AccountDetailsScreen>{

  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: const Text(
          "DashBoard",
          style: AppStyles.bigBoldWhiteTextStyle,),

        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.softWhiteColor,
              borderRadius: BorderRadius.circular(15)
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              "Doctor",
              style: AppStyles.normalPrimaryTextStyle,
            ),
          )
        ],

      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: isLoggedIn? const DoctorsDashBoard()
            : const PatientAccountDetails() //NoLoggedIn()
          ,)),

    );
  }

  Widget NoLoggedIn()
    => Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child:DSolidButton(
        label: "Login", 
        btnHeight: 45, 
        bgColor: AppColors.primaryColor, 
        borderRadius: 20, 
        textStyle: AppStyles.normalWhiteTextStyle, 
        onClick: ()=> Navigator.pushNamed(
                      context, RouteGenerator.loginScreen))),
    );
}