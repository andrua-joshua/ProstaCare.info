import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/articles_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({
    super.key
  });


  @override
  _homeScreenState createState () => _homeScreenState();


}


class _homeScreenState extends State<HomeScreen>{

  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "ProstaCare.Info",
          style: AppStyles.bigBoldWhiteTextStyle,),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications, color: Colors.white,)),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, RouteGenerator.accountDetailsScreen), 
            icon: const Icon(Icons.account_circle, color: Colors.white,))
        ],
      ),

      body: Consumer2<UserProvider, ArticlesProvider>(
        builder:(context, valueU, valueA, child) 
          => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    const Text(
                      "Prostate Cancer",
                      style: AppStyles.bigBoldPrimaryTextStyle,),
                    const SizedBox(height: 10,),
                    const Text(
                      "Overview",
                      style: AppStyles.titleBoldBlackTextStyle,),
                    const SizedBox(height: 10,),
                    SizedBox(
                      child: Text(
                      AppConstants.overviewString,
                      style: AppStyles.normalBlackTextStyle,
                      maxLines: !isShowMore? 5:null,
                      overflow: !isShowMore? TextOverflow.ellipsis: null,),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              setState(() {
                                isShowMore = !isShowMore;
                              });
                            }, 
                            child: Text(
                              isShowMore? "Show less": "Show All"))
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit_outlined, size:  35, color: Colors.orange,),
                          SizedBox(width: 10,),
                          Expanded(
                            child:Text(
                            "Basics",
                            style: AppStyles.bigBoldPrimaryTextStyle,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: List.generate(
                            AppConstants.basics2.length, (x)=> UnitBasicItemWidget(
                              details: AppConstants.basics2[x]['response']??"",
                              label: AppConstants.basics2[x]['label']??"")),
                        ),),
                    ),

                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:DSolidButton(
                      label: "Self Assess now", 
                      btnHeight: 43, 
                      bgColor: AppColors.primaryColor, 
                      borderRadius: 20, 
                      textStyle: AppStyles.normalWhiteTextStyle, 
                      onClick: (){
                        Navigator.pushNamed(
                          context, RouteGenerator.assesmentScreen);
                      })),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:DOutlinedButton(
                      label: "Find a Doctor", 
                      btnHeight: 43, 
                      borderColor: AppColors.primaryColor, 
                      borderRadius: 20, 
                      textStyle: AppStyles.normalBlackTextStyle, 
                      onClick: (){
                        if(valueU.patientModule!=null || valueU.doctorModule!=null){
                          Navigator.pushNamed(
                          context, RouteGenerator.allDoctorsScreen);  
                        }else{
                          Navigator.pushNamed(
                            context, RouteGenerator.loginScreen);
                        }
                      })),

                    const SizedBox(height: 30,),
                    const Text(
                      "Articles",
                      style: AppStyles.normalBlackTextStyle,),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: 
                        FutureBuilder(
                          future: valueA.articlesRepo.getAllArticles(
                            token:valueU.token, ), 
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
                                  height: 300,
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
                    const SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.format_quote, size:  35, color: Colors.orange,),
                          SizedBox(width: 10,),
                          Expanded(
                            child:Text(
                            "FAQs",
                            style: AppStyles.bigBoldPrimaryTextStyle,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: List.generate(
                            AppConstants.faqs.length, (x)=> UnitBasicItemWidget(
                              details: AppConstants.faqs[x]['response']??"",
                              label: AppConstants.faqs[x]['label']??"")),
                        ),),
                    ),

                    const SizedBox(height: 20,)
                  ],
                )
                ,
              ),)),),
    );
  }
}