import 'package:flutter/material.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';
import 'package:sample_app/utils/dialogs.dart';

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
          backgroundImage: AssetImage(imgUrl)
        ),
        const SizedBox(width: 15,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullname,
                style: AppStyles.normalBlackTextStyle,  
              ),
              const SizedBox(height: 2,),
              Text(
                email,
                style: AppStyles.normalBlackTextStyle,  
              ),
              const SizedBox(height: 2,),
              Text(
                phone,
                style: AppStyles.normalBlackTextStyle,  
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
          backgroundImage: AssetImage(imgUrl),),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: AppStyles.normalBlackTextStyle,
              ),
              Text(
                date,
                style: AppStyles.smallBlackTextStyle,
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
    return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                AccountSummaryWidget(
                  fullname: AppConstants.userInfo[2]['name']??"", 
                  email: AppConstants.userInfo[2]['email'], 
                  imgUrl: "assets/images/img.jpeg",
                  phone: AppConstants.userInfo[2]['phone']),
                const SizedBox(height: 40,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoWidget(
                        bgColor: Colors.white,
                        label: "Appointments",
                        value: "23",
                        width: 130,
                        height: 100),
                      InfoWidget(
                        bgColor: Colors.white,
                        label: "Assesments",
                        value: "13",
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
                  child: Column(
                    children: List.generate(
                      3, (x) => GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, 
                                builder: (context){
                                  return BookingViewDialog(
                                    doctorName: AppConstants.userInfo[x]['username'], 
                                    doctorEmail: AppConstants.userInfo[x]['email'], 
                                    date: "12th June, 2024", 
                                    time: "11:34 AM", 
                                    coverImg: "assets/images/img.jpeg");
                                  
                                });
                        },
                        child: UnitAppointment(
                        date: "12th June, 2024", 
                        doctorName: AppConstants.userInfo[x]['username'], 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "11:45"),
                      )),
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
                    child: Row(
                      children: List.generate(
                        4, (i) => i!=3? GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context, 
                              builder: (context){
                                return DoctorViewDialog(
                                  doctorName: AppConstants.userInfo[i]['username'], 
                                  doctorEmail: AppConstants.userInfo[i]['email'], 
                                  nin: "CMI23OU34JHKKJ23HH4", 
                                  phone: AppConstants.userInfo[i]['phone'],
                                  location: "Bukoto, main", 
                                  coverImg: "assets/images/img.jpeg");
                                
                              });
                          },
                          child: UserTitleCard(
                            imageUrl: "assets/images/img.jpeg", 
                            name: "Dr. ${AppConstants.userInfo[i]['username']}",
                            title: "The Begning of a new treatment age.", 
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
                    ),
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
                  child: Column(
                    children: List.generate(
                      3, (x) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, 
                            builder: (context){
                              return const GroupViewDialog(
                                groupTitle: 'Group title', 
                                groupDescription: AppConstants.assesmentQoutes,
                                groupLink: "https://group-link.com",
                                );
                              
                            });
                        },
                        child: const UnitAppointment(
                        date: "http:goroup-link.whatsapp.com", 
                        doctorName: "Group name", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "23"),
                      )),
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
          );
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
    return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                AccountSummaryWidget(
                  fullname: AppConstants.userInfo[0]['username']??"", 
                  email: AppConstants.userInfo[0]['email'], 
                  imgUrl: "assets/images/img.jpeg",
                  phone: "+25677052635362"),
                const SizedBox(height: 40,),
                SizedBox(
                  child: LayoutBuilder(
                    builder:(context, constraints) {
                      double width = constraints.maxWidth*0.30;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoWidget(
                            bgColor: Colors.white,
                            label: "Appointments",
                            value: "23",
                            width: width,
                            height: 100),
                          InfoWidget(
                            bgColor: Colors.white,
                            label: "Articles",
                            value: "13",
                            width: width,
                            height: 100),
                          InfoWidget(
                            bgColor: Colors.white,
                            label: "Groups",
                            value: "23",
                            width: width,
                            height: 100)
                        ],
                      );
                    },),
                ),
                const Divider(thickness: 0.6, color: Colors.grey,),
                const SizedBox(
                  child: Row(
                    children: [
                      const Expanded(child:Text(
                      "Bookings",
                      style: AppStyles.titleBlackTextStyle,
                    )),

                    SizedBox(width: 10,),
                    ],
                  ),
                ),
                

                const SizedBox(height: 15,),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      3, (x) => GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, 
                                builder: (context){
                                  return BookingViewDialog(
                                    doctorName: AppConstants.userInfo[x]['username'], 
                                    doctorEmail: AppConstants.userInfo[x]['email'], 
                                    date: "12th June, 2024", 
                                    time: "11:34 AM", 
                                    coverImg: "assets/images/img.jpeg");
                                  
                                });
                        },
                        child: UnitAppointment(
                        date: "12th June, 2024", 
                        doctorName: AppConstants.userInfo[x]['username'], 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "1$x:4$x"),
                      )),
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
                    child: Row(
                      children: List.generate(
                        4, (i) => i!=3? const ImageTitleCard(
                          imageUrl: "assets/images/img.jpeg", 
                          title: "The Begning of a new treatment age.", 
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
                    ),
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
                  child: Column(
                    children: List.generate(
                      1, (x) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, 
                            builder: (context){
                              return const GroupViewDialog(
                                groupTitle: 'Radiant youth, shining throug cancer', 
                                groupDescription: "Our supportive community of young individuals navigates the challenges of prostate cancer. We empower each other to to strive through shared experiences, compassionate about understanding, and valuable resources.\nWhether your survicor, currently undergoing treatment, or supporting a loved one, our group offers a safe space to find strength, guidance, and hope. Together, we illuminate the path towards awareness, healing and resilience. Join us and shine bright.",
                                groupLink: "https://chat.whatsapp.com/C5rNUn4YPG11EfCEI0xzcm",
                                );
                              
                            });
                        },
                        child: const UnitAppointment(
                        date: "http:goroup-link.whatsapp.com", 
                        doctorName: "Group name", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "23"),
                      )),
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
                  child: Column(
                    children: List.generate(
                      3, (x) => GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, 
                            builder: (context){
                              return PatientViewDialog(
                                patientName: AppConstants.userInfo[x]['username'], 
                                patientEmail: AppConstants.userInfo[x]['email'], 
                                nin: "CMI23OU34JHKKJ23HH4", 
                                phone: AppConstants.userInfo[x]['phone'], 
                                coverImg: "assets/images/img.jpeg");
                              
                            });
                        },
                        child: UnitPatient(
                          patientName: AppConstants.userInfo[x]['username']??"", 
                          imgUrl: "assets/images/img.jpeg", ),
                      )),
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
                    Navigator.pushNamed(context, RouteGenerator.allPatientsScreen);
                  }),),
                const SizedBox(height: 30,),
              ],
            ),
          );
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