import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/booking_provider.dart';
import 'package:sample_app/providers/group_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/dialogs.dart';

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


      body: Consumer2<UserProvider, BookingProvider>(
        builder:(context, valueU, valueB, child) 
          => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                SizedBox(
                  child: 
                  
                  valueU.doctorModule==null? Column(
                    children: List.generate(
                      AppConstants.userInfo.length, (x) => UnitPatient(
                        patientName: AppConstants.userInfo[x]['username'], 
                        imgUrl: "assets/images/img.jpeg", )),
                  ):
                  SizedBox(
                  child: SizedBox(
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
                                            return FutureBuilder(
                                              future: valueU.userRespositoryApi.getSinglePatientProfile(
                                                token: valueU.token, 
                                                patientId: data![x].patientId), 
                                              builder:(context, snapshot) {

                                                if(snapshot.hasData){
                                                  final datax = snapshot.data;

                                                  return PatientViewDialog(
                                                      patientName: datax!.name, 
                                                      patientEmail: datax.email, 
                                                      nin: datax.nin, 
                                                      phone: datax.phone, 
                                                      coverImg: datax.image);
                                                }
                                              
                                                if(snapshot.hasError){
                                                    return const Center(
                                                      child:SizedBox(
                                                        height: 300,
                                                        child: Text(
                                                          "Check your Internet and try Again",
                                                          style: AppStyles.normalGreyTextStyle,
                                                        ),
                                                      ));
                                                  }

                                                  return const Center(
                                                    child: CircularProgressIndicator(),
                                                  );


                                              });
                                            
                                          });
                                  },
                                  child: FutureBuilder(
                                    future: valueU.userRespositoryApi.getSinglePatientProfile(
                                      token: valueU.token, 
                                      patientId: data![x].patientId), 
                                    builder:(context, snapshot) {
                                      if(snapshot.hasData){
                                        final datax = snapshot.data;
                                        return UnitPatient(
                                            patientName: datax!.name, 
                                            imgUrl: datax.image, );
                                      }

                                      
                                      if(snapshot.hasError){
                                          return const Center(
                                            child:SizedBox(
                                              height: 300,
                                              child: Text(
                                                "Check your Internet and try Again",
                                                style: AppStyles.normalGreyTextStyle,
                                              ),
                                            ));
                                        }

                                        return Container(
                                          constraints:  const BoxConstraints.expand(
                                            height: 40,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          color: const Color.fromARGB(255, 250, 250, 250),
                                        );



                                    },)
                                  // UnitAppointment(
                                  // date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                  // doctorName: "patient name", 
                                  // imgUrl: "assets/images/img.jpeg", 
                                  // time: data![x].sessionDate.substring(data![x].sessionDate.length-6)),
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
                              // height: 100,
                              // width: 100,
                              child: CircularProgressIndicator(),
                            ));
                        },),
                  )),
                
                ),
              ],
            ),
          ),)),
    ));
  }
}