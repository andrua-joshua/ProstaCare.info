import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/articles_provider.dart';
import 'package:sample_app/providers/booking_provider.dart';
import 'package:sample_app/providers/group_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';
import 'package:sample_app/utils/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountSummaryWidget extends StatelessWidget{
  final String fullname;
  final String email;
  final String phone;
  final String imgUrl;
  const AccountSummaryWidget({
    super.key,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.imgUrl,
  });


  @override
  Widget build(BuildContext context) {
   return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // color: Colors.white
      border: Border.all(
        color: Colors.grey,
        width: 0.3
      )
    ),
    padding: const EdgeInsets.all(5),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imgUrl)
        ),
        const SizedBox(width: 15,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullname,
                style: AppStyles.normalBlackTextStyle,  
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2,),
              Text(
                email,
                style: AppStyles.normalBlackTextStyle,  
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2,),
              Text(
                phone,
                style: AppStyles.normalBlackTextStyle,  
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.settings, size: 40,))
      ],
    ),
   ); 
  }
}



class UnitAppointment extends StatelessWidget{
  final String date;
  final String doctorName;
  final String imgUrl;
  final String time;

  const UnitAppointment({
    super.key,
    required this.date,
    required this.doctorName,
    required this.imgUrl,
    required this.time
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // color: Colors.white
      border: Border.all(
        color: Colors.grey,
        width: 0.2
      )
    ),
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage (imgUrl),),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: AppStyles.normalBlackTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                date,
                style: AppStyles.smallBlackTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),

          Text(
            time,
            style: AppStyles.normalBlackTextStyle,
          ),
          SizedBox(width: 10,)
      ],
    ),
    );
  }

}


Widget InfoWidget(
  {
    required String label,
    required String value,
    required Color bgColor,
    required double width,
    required double height,
  }
) => Container(
  height: height,
  width: width,
  decoration: BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(15),
  ),

  padding: const EdgeInsets.all(10),
  margin: const EdgeInsets.all(5),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        label,
        textAlign: TextAlign.center,
        style: AppStyles.normalPrimaryTextStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 2,),
      Text(
        value,
        textAlign: TextAlign.center,
        style: AppStyles.titleBlackTextStyle,
      ),
    ],
  ),
);




class PatientAccountDetails extends StatelessWidget{
  const PatientAccountDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer4<UserProvider, ArticlesProvider, BookingProvider, GroupProvider>(
      builder:(context, valueU,valueA, valueB, valueG ,child)
       => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                AccountSummaryWidget(
                  fullname: valueU.patientModule!.name, 
                  email: valueU.patientModule!.email, 
                  imgUrl: valueU.patientModule!.image,
                  phone: valueU.patientModule!.phone),
                const SizedBox(height: 40,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FutureBuilder(
                      future: valueB.bookingRepo.getBookingsByPatient(
                        token: valueU.token, 
                        patientId: valueU.patientModule!.id), 
                        builder:(context, snapshot) => InfoWidget(
                          label: "Appoitments", 
                          value: snapshot.hasData? "${snapshot.data?.length??0}":"...", 
                          bgColor: Colors.white, 
                          width: 130, 
                          height: 100),),
                      InfoWidget(
                        bgColor: Colors.white,
                        label: "Assesments",
                        value: "3",
                        width: 130,
                        height: 100)
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.grey,),
                const Text(
                  "Bookings",
                  style: AppStyles.titleBlackTextStyle,
                ),

                const SizedBox(height: 15,),
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
                              data!.length>=4? 4: 
                                data?.length??0 , (x) => GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context, 
                                        builder: (context){
                                          return FutureBuilder(
                                            future: valueU.userRespositoryApi.getSingleDoctorProfile(
                                              token: valueU.token, 
                                              doctorId: data[x].doctorId), 
                                            builder:(context, snapshot) {

                                              if(snapshot.hasData){
                                                final datax = snapshot.data;

                                                return BookingViewDialog(
                                                  doctorName: datax!.name, 
                                                  doctorEmail: datax.email, 
                                                  date: data[x].sessionDate.substring(0, data[x].sessionDate.length-5), 
                                                  time: data[x].sessionDate.substring(data[x].sessionDate.length-6), 
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

                                          
                                          // BookingViewDialog(
                                          //   doctorName: AppConstants.userInfo[x]['username'], 
                                          //   doctorEmail: AppConstants.userInfo[x]['email'], 
                                          //   date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                          //   time: data![x].sessionDate.substring(data![x].sessionDate.length-6), 
                                          //   coverImg: "assets/images/img.jpeg");
                                          
                                        });
                                },
                                child: FutureBuilder(
                                  future: valueU.userRespositoryApi.getSingleDoctorProfile(
                                    token: valueU.token, 
                                    doctorId: data[x].doctorId), 
                                  builder:(context, snapshot) {
                                    if(snapshot.hasData){
                                      final datax = snapshot.data;
                                      return UnitAppointment(
                                        date: data[x].sessionDate.substring(0, data[x].sessionDate.length-5), 
                                        doctorName: datax!.name, 
                                        imgUrl: datax.image, 
                                        time: data![x].sessionDate.substring(data![x].sessionDate.length-6));
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
                            child: CircularProgressIndicator(),
                          ));
                      },),
                ),

                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: DSolidButton(
                  label: "View All", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 20, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){
                    Navigator.pushNamed(context, RouteGenerator.allBookingsScreen);
                  }),),
                const SizedBox(height: 30,),

                const Text(
                  "Doctors",
                  style: AppStyles.titleBlackTextStyle,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                      future: valueU.userRespositoryApi.getAllDoctor(
                        token: valueU.token), 
                      builder:(context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data = snapshot.data;

                          return Row(
                              children: List.generate(
                                data!.length>=4? 4: 
                                data?.length??0, (i) => i!=3? GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context, 
                                      builder: (context){
                                        return DoctorViewDialog(
                                          doctorName: data[i].name, 
                                          doctorEmail: data[i].email, 
                                          nin: data[i].nin, 
                                          phone: data[i].phone,
                                          location: data[i].location, 
                                          coverImg: data[i].image);
                                        
                                      });
                                  },
                                  child: UserTitleCard(
                                    imageUrl: data[i].image, 
                                    name: "Dr. ${data[i].name}",
                                    title: "Orthopendist", 
                                    textStyle: AppStyles.normalBlackTextStyle, 
                                    width: 150, 
                                    height: 200),
                                )
                                : TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, RouteGenerator.allDoctorsScreen);
                                  }, child:  const Text(
                                      "View All",
                                      style: AppStyles.normalPrimaryTextStyle,
                                    ))),
                            );
                        }

                        if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              height: 300,
                              child: Text(
                                "Failed to Fetch Doctors\n Check your Internet and try Again",
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
                  ),
                ),
                const SizedBox(height: 30,),

                const Divider(thickness: 0.3, color: Colors.grey,),
                const Text(
                  "Groups",
                  style: AppStyles.titleBlackTextStyle,
                ),

                const SizedBox(height: 15,),
                SizedBox(
                  child: FutureBuilder(
                    future: valueG.groupRepo.getAllGroups(
                      token: valueU.token,),
                    builder:(context, snapshot) {
                      
                      if(snapshot.hasData){
                        final data = snapshot.data;
                        return Column(
                          children: List.generate(
                            data!.length>=4? 3: 
                                data?.length??0, (x) => GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context, 
                                  builder: (context){
                                    return GroupViewDialog(
                                      groupTitle: data![x].title, 
                                      groupDescription: data[x].description,
                                      groupLink: data[x].link,
                                      );
                                    
                                  });
                              },
                              child: UnitAppointment(
                              date: data[x].link, 
                              doctorName: data[x].title, 
                              imgUrl: data[x].coverImg, 
                              time: ""),
                            )),
                        );
                      }


                      if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              height: 300,
                              child: Text(
                                "Failed to Fetch Groups\n Check your Internet and try Again",
                                style: AppStyles.normalGreyTextStyle,
                              ),
                            ));
                        }

                        return const Center(
                          child:SizedBox(
                            // height: 300,
                            child: CircularProgressIndicator(),
                          ));
                      
                      
                    },
                  ),
                ),

                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: DSolidButton(
                  label: "View All", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 20, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){
                    Navigator.pushNamed(context, RouteGenerator.allGroupsScreen);
                  }),),
                SizedBox(height: 15,)
              ],
            ),
          ));
  }
}



class DoctorsDashBoard extends StatefulWidget{
  const DoctorsDashBoard({
    super.key
  });

  @override
  _doctorsDashboardState createState () => _doctorsDashboardState();

}


class _doctorsDashboardState extends State<DoctorsDashBoard>{

  @override
  Widget build(BuildContext context) {
    return Consumer4<UserProvider, ArticlesProvider, BookingProvider, GroupProvider>(
      builder:(context, valueU,valueA, valueB, valueG ,child)
       => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                AccountSummaryWidget(
                  fullname: valueU.doctorModule!.name, 
                  email: valueU.doctorModule!.email, 
                  imgUrl: valueU.doctorModule!.image,
                  phone: valueU.doctorModule!.phone),
                const SizedBox(height: 40,),
                SizedBox(
                  child: LayoutBuilder(
                    builder:(context, constraints) {
                      double width = constraints.maxWidth*0.30;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          FutureBuilder(
                            future: valueB.bookingRepo.getBookingsByDoctor(
                              token: valueU.token, 
                              doctorId: valueU.doctorModule!.id), 
                              builder:(context, snapshot) => InfoWidget(
                                label: "Appoitments", 
                                value: snapshot.hasData? "${snapshot.data?.length??0}":"...", 
                                bgColor: Colors.white, 
                                width: width, 
                                height: 100),),

                          FutureBuilder(
                            future: valueA.articlesRepo.getArticlesByDoctorId(
                              token: valueU.token, 
                              doctorId: valueU.doctorModule!.id), 
                              builder:(context, snapshot) => InfoWidget(
                                label: "Articles", 
                                value: snapshot.hasData? "${snapshot.data?.length??0}":"...", 
                                bgColor: Colors.white, 
                                width: width, 
                                height: 100),),
                          
                          FutureBuilder(
                            future: valueG.groupRepo.getGroupsByDoctor(
                              token: valueU.token, 
                              doctorId: valueU.doctorModule!.id), 
                              builder:(context, snapshot) => InfoWidget(
                                label: "Groups", 
                                value: snapshot.hasData? "${snapshot.data?.length??0}":"...", 
                                bgColor: Colors.white, 
                                width: width, 
                                height: 100),),
                        ],
                      );
                    },),
                ),
                const Divider(thickness: 0.6, color: Colors.grey,),
                const SizedBox(
                  child: Row(
                    children: [
                      Expanded(child:Text(
                      "Bookings",
                      style: AppStyles.titleBlackTextStyle,
                    )),

                    SizedBox(width: 10,),
                    ],
                  ),
                ),
                

                const SizedBox(height: 15,),
                SizedBox(
                  child: FutureBuilder(
                    future: valueB.bookingRepo.getBookingsByDoctor(
                      token: valueU.token, 
                      doctorId: valueU.doctorModule!.id), 
                      builder: (context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data = snapshot.data;

                          return Column(
                            children: List.generate(
                              data!.length>=4? 4: 
                                data?.length??0 , (x) => GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context, 
                                        builder: (context){
                                          return FutureBuilder(
                                            future: valueU.userRespositoryApi.getSinglePatientProfile(
                                              token: valueU.token, 
                                              patientId: data[x].patientId), 
                                            builder:(context, snapshot) {

                                              if(snapshot.hasData){
                                                final datax = snapshot.data;

                                                return BookingViewDialog(
                                                  doctorName: datax!.name, 
                                                  doctorEmail: datax.email, 
                                                  date: data[x].sessionDate.substring(0, data[x].sessionDate.length-5), 
                                                  time: data[x].sessionDate.substring(data[x].sessionDate.length-6), 
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
                                    patientId: data[x].patientId), 
                                  builder:(context, snapshot) {
                                    if(snapshot.hasData){
                                      final datax = snapshot.data;
                                      return UnitAppointment(
                                        date: data[x].sessionDate.substring(0, data[x].sessionDate.length-5), 
                                        doctorName: datax!.name, 
                                        imgUrl: datax.image, 
                                        time: data![x].sessionDate.substring(data![x].sessionDate.length-6));
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
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: DSolidButton(
                  label: "View All", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 20, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){
                    Navigator.pushNamed(context, RouteGenerator.allBookingsScreen);
                  }),),
                
                const SizedBox(height: 20,),

                SizedBox(
                  child: Row(
                    children: [
                      const Expanded(child:Text(
                      "Articles",
                      style: AppStyles.titleBlackTextStyle,
                    )),

                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5
                        ),
                        
                      ),
                      // padding: const EdgeInsets.all(1),
                      child: 
                          IconButton(
                            onPressed: (){
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, 
                                builder: (context){
                                  return const AddArticleDialog();
                                  
                                });
                            }, 
                            icon: const Icon(Icons.add, size: 20,))
                    ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  FutureBuilder(
                      future: valueA.articlesRepo.getArticlesByDoctorId(
                        token:valueU.token, 
                        doctorId: valueU.doctorModule!.id), 
                        builder:(context, snapshot) {
                          
                          if(snapshot.hasData){
                            final data = snapshot.data;

                            return Row(
                              children: List.generate(
                                data!.length>=4? 4: 
                                data?.length??0 , (i) => i!=3? ImageTitleCard(
                                  imageUrl: data[i].image, 
                                  title: data[i].content, 
                                  link: data[i].link,
                                  textStyle: AppStyles.normalBlackTextStyle, 
                                  width: 170, 
                                  height: 200): TextButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, RouteGenerator.allArticlesScreen);
                                    }, 
                                    child: const Text(
                                      "View All",
                                      style: AppStyles.normalPrimaryTextStyle,
                                    ))),
                            );
                          }

                        if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              // height: 300,
                              child: Text(
                                "Failed to Fetch Articles\n Check your Internet and try Again",
                                style: AppStyles.normalGreyTextStyle,
                              ),
                            ));
                        }

                        return const Center(
                          child:SizedBox(
                            // height: 300,
                            child: CircularProgressIndicator(),
                          ));


                        },),
                  ),
                ),
                const SizedBox(height: 30,),

                const Divider(thickness: 0.3, color: Colors.grey,),
                SizedBox(
                  child: Row(
                    children: [
                      const Expanded(child:Text(
                      "Groups",
                      style: AppStyles.titleBlackTextStyle,
                    )),

                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5
                        ),
                        
                      ),
                      // padding: const EdgeInsets.all(1),
                      child: 
                          IconButton(
                            onPressed: (){
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, 
                                builder: (context){
                                  return const CreateGroupDialog();
                                  
                                });
                            }, 
                            icon: const Icon(Icons.add, size: 20,))
                    ),
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                SizedBox(
                  child: FutureBuilder(
                    future: valueG.groupRepo.getGroupsByDoctor(
                      token: valueU.token, 
                      doctorId: valueU.doctorModule!.id),
                    builder:(context, snapshot) {
                      
                      if(snapshot.hasData){
                        final data = snapshot.data;
                        return Column(
                          children: List.generate(
                            data!.length>=4? 3: 
                                data?.length??0, (x) => GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context, 
                                  builder: (context){
                                    return GroupViewDialog(
                                      groupTitle: data![x].title, 
                                      groupDescription: data[x].description,
                                      groupLink: data[x].link,
                                      );
                                    
                                  });
                              },
                              child: UnitAppointment(
                              date: data[x].link, 
                              doctorName: data[x].title, 
                              imgUrl: "", 
                              time: ""),
                            )),
                        );
                      }


                      if(snapshot.hasError){
                          return const Center(
                            child:SizedBox(
                              height: 300,
                              child: Text(
                                "Failed to Fetch Groups\n Check your Internet and try Again",
                                style: AppStyles.normalGreyTextStyle,
                              ),
                            ));
                        }

                        return const Center(
                          child:SizedBox(
                            // height: 300,
                            child: CircularProgressIndicator(),
                          ));
                      
                      
                    },
                  ),
                ),

                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: DSolidButton(
                  label: "View All", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 20, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){
                    Navigator.pushNamed(context, RouteGenerator.allGroupsScreen);
                  }),),


                
                const SizedBox(height: 30,),

                const Divider(thickness: 0.3, color: Colors.grey,),
                const Text(
                  "Patients",
                  style: AppStyles.titleBlackTextStyle,
                ),

                const SizedBox(height: 15,),
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
                              data!.length>=4? 4: 
                                data?.length??0 , (x) => GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context, 
                                        builder: (context){
                                          return FutureBuilder(
                                            future: valueU.userRespositoryApi.getSinglePatientProfile(
                                              token: valueU.token, 
                                              patientId: data[x].patientId), 
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

                                          
                                          // BookingViewDialog(
                                          //   doctorName: AppConstants.userInfo[x]['username'], 
                                          //   doctorEmail: AppConstants.userInfo[x]['email'], 
                                          //   date: data![x].sessionDate.substring(0, data![x].sessionDate.length-5), 
                                          //   time: data![x].sessionDate.substring(data![x].sessionDate.length-6), 
                                          //   coverImg: "assets/images/img.jpeg");
                                          
                                        });
                                },
                                child: FutureBuilder(
                                  future: valueU.userRespositoryApi.getSinglePatientProfile(
                                    token: valueU.token, 
                                    patientId: data[x].patientId), 
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
                  
                  
                  
                  
                  
                  
                  
                  ///=========================================use the sample below
                //   Column(
                //     children: List.generate(
                //       3, (x) => GestureDetector(
                //         onTap: (){
                //           showModalBottomSheet(
                //             isScrollControlled: true,
                //             context: context, 
                //             builder: (context){
                //               return PatientViewDialog(
                //                 patientName: AppConstants.userInfo[x]['username'], 
                //                 patientEmail: AppConstants.userInfo[x]['email'], 
                //                 nin: "CMI23OU34JHKKJ23HH4", 
                //                 phone: AppConstants.userInfo[x]['phone'], 
                //                 coverImg: "assets/images/img.jpeg");
                              
                //             });
                //         },
                //         child: UnitPatient(
                //           patientName: AppConstants.userInfo[x]['username']??"", 
                //           imgUrl: "assets/images/img.jpeg", ),
                //       )),
                //   ),
                // ),

                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: DSolidButton(
                  label: "View All", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 20, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){
                    Navigator.pushNamed(context, RouteGenerator.allPatientsScreen);
                  }),),
                const SizedBox(height: 30,),
              ],
            ),
      ));
  }
}





class UnitPatient extends StatelessWidget{
  final String patientName;
  final String imgUrl;

  const UnitPatient({
    super.key,
    required this.patientName,
    required this.imgUrl,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imgUrl),),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientName,
                style: AppStyles.normalBlackTextStyle,
              ),
            ],
          )),
      ],
    ),
    );
  }

}