import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/articles_provider.dart';
import 'package:sample_app/providers/group_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/cutom_widgets.dart';
import 'package:sample_app/utils/dialogs.dart';

class AllGroupsScreen extends StatefulWidget{
  const AllGroupsScreen({
    super.key
  });


  @override
  _allGroupsScreenState createState () => _allGroupsScreenState();
  
}


class _allGroupsScreenState extends State<AllGroupsScreen>{

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
          "Groups",
          style: AppStyles.bigBoldWhiteTextStyle,),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),


      body: Consumer2<UserProvider, GroupProvider>(
        builder:(context, valueU, valueG, child) 
          => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                valueU.patientModule!=null? SizedBox(
                  child: FutureBuilder(
                    future: valueG.groupRepo.getAllGroups(
                      token: valueU.token,),
                    builder:(context, snapshot) {
                      
                      if(snapshot.hasData){
                        final data = snapshot.data;
                        return Column(
                          children: List.generate(
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
                              date: data![x].link, 
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
                            height: 300,
                            child: CircularProgressIndicator(),
                          ));
                      
                      
                    },
                  ),
                ):
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
                            height: 300,
                            child: CircularProgressIndicator(),
                          ));
                      
                      
                    },
                  ),
                )
              

              ],
            ),
          ),)),
    ));
  }
}