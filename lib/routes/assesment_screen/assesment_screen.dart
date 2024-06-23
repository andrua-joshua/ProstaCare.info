import 'package:flutter/material.dart';
import 'package:sample_app/routes/assesment_screen/widgets/assesment_screen_widgets.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:sample_app/utils/app_styles.dart';

class AssesmentScreen extends StatefulWidget{
  const AssesmentScreen({super.key});

  @override
  _assesmentScreenState createState () => _assesmentScreenState();

}

class _assesmentScreenState extends State<AssesmentScreen>{
  ScrollController _controller = ScrollController();

  int currentStep = 0;
  final List<int> score = List.filled(
    AppConstants.assesments.length, 0);

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
          "Self Assesment",
          style: AppStyles.bigBoldWhiteTextStyle,),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: 
          SingleChildScrollView(
            controller: _controller,
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                const Text(
                  AppConstants.assesmentQoutes,
                  style: AppStyles.normalBlackTextStyle,
                ),
                Stepper(
                  controller: _controller,
                  currentStep: currentStep,
                  onStepContinue: (){
                    if(currentStep==9){}
                    else{
                      setState(() {
                        currentStep++;
                      });
                    }
                  },
                  onStepCancel: (){
                    if(currentStep==0){}
                    else{
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  onStepTapped: (i){
                    // setState(() {
                    //   currentStep = i;
                    // });
                  },
                  stepIconBuilder: (stepIndex, stepState) {
                    if(stepIndex<currentStep){
                      return const Icon(Icons.check_circle_rounded, color: AppColors.primaryColor,);
                      
                    }
                  },

                  controlsBuilder: (context, details) {
                    return Row(
                      children: [
                        
                        TextButton(
                          onPressed: (){
                            if(currentStep==0){}
                            else{
                              setState(() {
                                currentStep--;
                              });
                            }
                          }, 
                          child: Text("Back")),


                        TextButton(
                          onPressed: (){
                            if(currentStep==AppConstants.assesments.length-1){
                              
                              int _score = 0;
                              for(int v in score) _score+=v;
                              print("The scores:::   $score ::::: User Score:  $_score");
                              showModalBottomSheet(
                                context: context, 
                                builder: (context){
                                  return AssesmentScoreWidget(score: _score);
                                });

                            }
                            else{
                              setState(() {
                                currentStep++;
                              });
                            }
                          }, 
                          child: Text("Next")),
                      ],
                    );
                  },

                  steps: List.generate(
                    AppConstants.assesments.length, (i)=> Step(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child:Text(
                        AppConstants.assesments[i]['Question']??"",
                        style: AppStyles.normalBoldBlackTextStyle,
                      )),
                      content: UnitAssesment(
                        onSelect: (pO){
                          setState(() {
                            score[i] = pO;
                          });
                        },
                        question: "",
                        options: AppConstants.assesments[i]['options']??[],
                        ))))
              ],
            ),
          ),
          )),
    );
  }
}