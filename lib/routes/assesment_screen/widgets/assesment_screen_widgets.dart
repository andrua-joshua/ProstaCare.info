import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';

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