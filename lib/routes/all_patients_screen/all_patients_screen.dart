import 'package:flutter/material.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';

class AllPatientsScreen extends StatefulWidget{
  const AllPatientsScreen({
    super.key
  });


  @override
  _allPatientsScreenState createState () => _allPatientsScreenState();
  
}


class _allPatientsScreenState extends State<AllPatientsScreen>{

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
          "Patients",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      AppConstants.userInfo.length, (x) => UnitPatient(
                        patientName: AppConstants.userInfo[x]['username'], 
                        imgUrl: "assets/images/img.jpeg", )),
                  ),
                ),
              ],
            ),
          ),)),
    );
  }
}