import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';

class ReadArticlesScreen extends StatefulWidget{
  const ReadArticlesScreen({super.key});


  @override
  _readArticlesScreenState createState () => _readArticlesScreenState();

}


class _readArticlesScreenState extends State<ReadArticlesScreen>{


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
          "Read Article",
          style: AppStyles.bigBoldWhiteTextStyle,),

      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                Image.asset("assets/images/img.jpeg"),
                const SizedBox(height: 25,),
                const Text(
                  "Artical topics",
                  style: AppStyles.titleBoldBlackTextStyle,
                ),
                Container(
                  width: 100,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2)
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  AppConstants.overviewString,
                  style: AppStyles.normalBlackTextStyle,
                )
              ],
            ),
          ),)),
    ); 
  }
}