import 'package:flutter/material.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class AllBookingsScreen extends StatefulWidget{
  const AllBookingsScreen({
    super.key
  });


  @override
  _allBookingsScreenState createState () => _allBookingsScreenState();
  
}


class _allBookingsScreenState extends State<AllBookingsScreen>{

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
          "My Bookings",
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
                DSections(
                  options: const [
                    "All","Pending","Confirmed"
                  ], 
                  activeIndex: selectionIndex,
                  activeColor: AppColors.primaryColor, 
                  inActiveColor: AppColors.softWhiteColor, 
                  activeStyle: AppStyles.normalWhiteTextStyle, 
                  inActiveStyle: AppStyles.normalBlackTextStyle, 
                  onSelect: (p){
                    setState(() {
                      selectionIndex = p;
                    });
                  }),
                const SizedBox(height: 20,),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      AppConstants.userInfo.length, (x) => UnitAppointment(
                        date: "12th June, 2024", 
                        doctorName: AppConstants.userInfo[x]['username'], 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "11:45")),
                  ),
                ),
              ],
            ),
          ),)),
    );
  }
}