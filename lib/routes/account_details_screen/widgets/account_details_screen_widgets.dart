import 'package:flutter/material.dart';
import 'package:sample_app/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

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
                const AccountSummaryWidget(
                  fullname: "John Doe", 
                  email: "drillox@gmail.com", 
                  imgUrl: "assets/images/img.jpeg",
                  phone: "+25677052635362"),
                const SizedBox(height: 40,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20
                //   ),
                //   child: DSolidButton(
                //   label: "Dashboard", 
                //   btnHeight: 45, 
                //   bgColor: AppColors.primaryColor, 
                //   borderRadius: 20, 
                //   textStyle: AppStyles.normalWhiteTextStyle, 
                //   onClick: (){

                //   }),),
                // const SizedBox(height: 20,),
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
                      3, (x) => const UnitAppointment(
                        date: "12th June, 2024", 
                        doctorName: "John Doe", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "11:45")),
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
                        4, (i)=> const UserTitleCard(
                          imageUrl: "assets/images/img.jpeg", 
                          name: "Dr. John Doe",
                          title: "The Begning of a new treatment age.", 
                          textStyle: AppStyles.normalBlackTextStyle, 
                          width: 150, 
                          height: 200)),
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
                      3, (x) => const UnitAppointment(
                        date: "http:goroup-link.whatsapp.com", 
                        doctorName: "Group name", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "23")),
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
                const AccountSummaryWidget(
                  fullname: "John Doe", 
                  email: "drillox@gmail.com", 
                  imgUrl: "assets/images/img.jpeg",
                  phone: "+25677052635362"),
                const SizedBox(height: 40,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20
                //   ),
                //   child: DSolidButton(
                //   label: "Dashboard", 
                //   btnHeight: 45, 
                //   bgColor: AppColors.primaryColor, 
                //   borderRadius: 20, 
                //   textStyle: AppStyles.normalWhiteTextStyle, 
                //   onClick: (){

                //   }),),
                // const SizedBox(height: 20,),
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
                SizedBox(
                  child: Row(
                    children: [
                      const Expanded(child:Text(
                      "Bookings",
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
                            onPressed: (){}, 
                            icon: const Icon(Icons.add, size: 20,))
                    ),
                    ],
                  ),
                ),
                

                const SizedBox(height: 15,),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      3, (x) => const UnitAppointment(
                        date: "12th June, 2024", 
                        doctorName: "John Doe", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "11:45")),
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

                  }),),
                
                const SizedBox(height: 20,),

                SizedBox(
                  child: Row(
                    children: [
                      const Expanded(child:Text(
                      "Articles",
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
                            onPressed: (){}, 
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
                        4, (i)=> const ImageTitleCard(
                          imageUrl: "assets/images/img.jpeg", 
                          title: "The Begning of a new treatment age.", 
                          textStyle: AppStyles.normalBlackTextStyle, 
                          width: 170, 
                          height: 200)),
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
                            onPressed: (){}, 
                            icon: const Icon(Icons.add, size: 20,))
                    ),
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      3, (x) => const UnitAppointment(
                        date: "http:goroup-link.whatsapp.com", 
                        doctorName: "Group name", 
                        imgUrl: "assets/images/img.jpeg", 
                        time: "23")),
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
                      3, (x) => const UnitPatient(
                        patientName: "Patient name", 
                        imgUrl: "assets/images/img.jpeg", )),
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