import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/articles_provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/routes/account_details_screen/widgets/account_details_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class AllArticlesScreen extends StatefulWidget{
  const AllArticlesScreen({
    super.key
  });


  @override
  _allArticlesScreenState createState () => _allArticlesScreenState();
  
}


class _allArticlesScreenState extends State<AllArticlesScreen>{

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
          "Articles",
          style: AppStyles.bigBoldWhiteTextStyle,),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),


      body: Consumer2<UserProvider, ArticlesProvider>(
        builder:(context, valueU, valueA, child) 
          => SafeArea(
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
                    FutureBuilder(
                          future: valueA.articlesRepo.getAllArticles(
                            token:valueU.token, ), 
                            builder:(context, snapshot) {
                              
                              if(snapshot.hasData){
                                final data = snapshot.data;

                                return DGridWidget(
                                  colCount: 2,
                                  children: List.generate(
                                    data?.length??0, (i)=> ImageTitleCard(
                                      imageUrl: data![i].image, 
                                      title: data![i].content, 
                                      link: data![i].link,
                                      textStyle: AppStyles.normalBlackTextStyle, 
                                      width: width, 
                                      height: 200)), 
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


                            },)
                  ],
                ),
              );
            },),)),
    ));
  }
}