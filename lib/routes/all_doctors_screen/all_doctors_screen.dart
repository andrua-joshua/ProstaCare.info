import 'package:flutter/material.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class AllDoctorsScreen extends StatefulWidget{
  const AllDoctorsScreen({
    super.key
  });


  @override
  _allDoctorsScreenState createState () => _allDoctorsScreenState();
  
}


class _allDoctorsScreenState extends State<AllDoctorsScreen>{

  int selectionIndex = 0;

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
          "Doctors",
          style: AppStyles.bigBoldWhiteTextStyle,),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: LayoutBuilder(
            builder:(context, constraints) {
              double width = constraints.maxWidth*0.44;
              return SingleChildScrollView(
              child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    DGridWidget(
                      colCount: 2,
                      children: List.generate(
                        AppConstants.userInfo.length, (i)=>  UserTitleCard(
                          imageUrl: "assets/images/img.jpeg", 
                          name: "Dr. ${AppConstants.userInfo[i]['username']}",
                          title: "The Begning of a new treatment age.", 
                          textStyle: AppStyles.normalBlackTextStyle, 
                          width: width, 
                          height: 200)), 
                      )
                  ],
                ),
              );
            },),)),
    );
  }
}