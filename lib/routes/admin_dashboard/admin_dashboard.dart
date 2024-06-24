import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';

class AdminDashboard extends StatefulWidget{
  const AdminDashboard({
    super.key
  });

  
  @override
  _adminDashBoardState createState () => _adminDashBoardState();

}


class _adminDashBoardState extends State<AdminDashboard>{

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


      ),
    );
  }
}