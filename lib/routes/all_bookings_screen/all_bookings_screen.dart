import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/articles_provider.dart';
import 'package:sample_app/providers/booking_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/cutom_widgets.dart';
import 'package:sample_app/utils/dialogs.dart';

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


      body: Consumer2<UserProvider, BookingProvider>(
        builder:(context, valueU, valueB, child) 
          =>SafeArea(
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
                valueU.doctorModule!=null? SizedBox(
                  child: FutureBuilder(
                    future: valueB.bookingRepo.getBookingsByDoctor(
                      token: valueU.token, 
                      doctorId: valueU.doctorModule!.id), 
                      builder: (context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data = snapshot.data;

                          return Column(
                            children: List.generate(
                              data?.length??0 , (x) => GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context, 
                                        builder: (context){
                                          return BookingViewDialog(
                                            doctorName: AppConstants.userInfo[x]['username'], 
                                            doctorEmail: AppConstants.userInfo[x]['email'], 
                                            date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                            time: data![x].sessionDate.substring(data![x].sessionDate.length-6), 
                                            coverImg: "assets/images/img.jpeg");
                                          
                                        });
                                },
                                child: UnitAppointment(
                                date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                doctorName: "patient name", 
                                imgUrl: "assets/images/img.jpeg", 
                                time: data![x].sessionDate.substring(data![x].sessionDate.length-6)),
                              )),
                          );
                        }


                        if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              height: 300,
                              child: Text(
                                "Failed to Fetch bookings\n Check your Internet and try Again",
                                style: AppStyles.normalGreyTextStyle,
                              ),
                            ));
                        }

                        return const Center(
                          child:SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(),
                          ));
                      },),
                ):
                SizedBox(
                  child: FutureBuilder(
                    future: valueB.bookingRepo.getBookingsByPatient(
                      token: valueU.token, 
                      patientId: valueU.patientModule!.id), 
                      builder: (context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data = snapshot.data;

                          return Column(
                            children: List.generate(
                              data?.length??0 , (x) => GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context, 
                                        builder: (context){
                                          return BookingViewDialog(
                                            doctorName: AppConstants.userInfo[x]['username'], 
                                            doctorEmail: AppConstants.userInfo[x]['email'], 
                                            date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                            time: data![x].sessionDate.substring(data![x].sessionDate.length-6), 
                                            coverImg: "assets/images/img.jpeg");
                                          
                                        });
                                },
                                child: UnitAppointment(
                                date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                doctorName: "doctor name", 
                                imgUrl: "assets/images/img.jpeg", 
                                time: data![x].sessionDate.substring(data![x].sessionDate.length-6)),
                              )),
                          );
                        }


                        if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              // height: 300,
                              child: Text(
                                "Failed to Fetch bookings\n Check your Internet and try Again",
                                style: AppStyles.normalGreyTextStyle,
                              ),
                            ));
                        }

                        return const Center(
                          child:SizedBox(
                            height: 100,
                            child: CircularProgressIndicator(),
                          ));
                      },),
                )
                ,
              ],
            ),
          ),))),
    );
  }
}