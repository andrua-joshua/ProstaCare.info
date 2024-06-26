import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/buttons.dart';

class UnitAssesment extends StatefulWidget{
  final String question;
  final List<String> options;
  final Function(int) onSelect;

  const UnitAssesment({
    super.key,
    required this.question,
    required this.options,
    required this.onSelect
  });


  @override
  _unitAssesmentState createState ()=> _unitAssesmentState();



}


class _unitAssesmentState extends State<UnitAssesment>{

  final List<String> alphaBets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

  int? _index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   widget.question,
        //   style: AppStyles.normalBlackTextStyle,
        // ),
        // const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 1
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            List.generate(
              widget.options.length, 
              (x) => optionItem(
                label: alphaBets[x], 
                value: widget.options[x], 
                index: x)),
          ),
          )
      ],
    );
  }


  Widget optionItem({
    required String label,
    required String value,
    required int index
  }) => GestureDetector(
    onTap: (){
      widget.onSelect(index);
      setState(() {
        _index = index;
        
      });
    },
    child: Row(
    children: [
      index == _index? const Icon(
        Icons.check_circle_outline, 
        color: AppColors.primaryColor,
        size: 30,
        ):Text(
          "  $label. ",
          style: AppStyles.bigBoldBlackTextStyle,
        ),

        const SizedBox(width: 10,),
        Text(
          value,
          style: AppStyles.normalBlackTextStyle,
        )
    ],
  ),
  );

}



class AssesmentScoreWidget extends StatelessWidget{
  final int score;
  const AssesmentScoreWidget({
    super.key,
    required this.score
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder:(context, valueU, child)
         => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),

          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 30,),
              score<8? const Center(
                child: Icon(
                  Icons.check_circle_outline_outlined, size: 60, color: Colors.green,),
              )
              :score<16? const Center(
                child: Icon(
                  Icons.warning_amber, size: 60, color: Colors.orange,),
              )
              :const Center(
                child: Icon(
                  Icons.dangerous_outlined, size: 60, color: Colors.red,),
              ) ,

              const SizedBox(height: 10,),
              score<8? const Text(
                "Low Risk",
                style: AppStyles.bigBoldBlackTextStyle,
              )
              :score<16? const Text(
                "Modorate Risk",
                style: AppStyles.bigBoldBlackTextStyle,
              ): const Text(
                "High Risk",
                style: AppStyles.bigBoldBlackTextStyle,
              ),

              const SizedBox(height: 10,),
              Text(
                "$score",
                style: AppStyles.bigBoldBlackTextStyle,
              ),
              
              const SizedBox(height: 30,),
              DSolidButton(
                label: score<8? "Go to Home":score<16? "Inqure from Doctor": "Book A Session", 
                btnHeight: 45, 
                bgColor: AppColors.primaryColor, 
                borderRadius: 20, 
                textStyle: AppStyles.normalBoldBlackTextStyle, 
                onClick: (){
                  if(score<8){
                    Navigator.pushNamed(context, RouteGenerator.homeScren); 
                    
                  }else{
                    if(valueU.doctorModule!=null || valueU.patientModule!=null){
                      Navigator.pushNamed(context, RouteGenerator.allDoctorsScreen);
                    }else{
                      Navigator.pushNamed(context, RouteGenerator.loginScreen); 
                    }
                    
                  }
                })
            ],
          ),
        ),);
  }
}