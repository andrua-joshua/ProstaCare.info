import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';

class UserTitleCard extends StatefulWidget{
  final String imageUrl;
  final String title;
  final String name;
  final TextStyle textStyle;
  final double width;
  final double height;

  const UserTitleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.name,
    required this.textStyle,
    required this.width,
    required this.height
  });


  @override
  _UserTitleCardState createState() => _UserTitleCardState();

}


class _UserTitleCardState extends State<UserTitleCard>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: AppColors.softWhiteColor
        border: Border.all(
          color: AppColors.greyColor,
          width: 0.5
        )
      ),

      margin: const EdgeInsets.symmetric(horizontal: 10),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: widget.height*0.5,
            width: widget.height*0.5,
            // constraints: BoxConstraints.expand(
            //   height: widget.height*0.7,
            // ),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),e
              border: Border.all(
                color: AppColors.greyColor,
                width: 1
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.imageUrl))
            ),
            margin: const EdgeInsets.all(10),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: widget.textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  Expanded(
                    child:Text(
                    widget.title,
                    style: AppStyles.normalGreyTextStyle,
                    // maxLines: 2,
                    overflow: TextOverflow.ellipsis,))
                ],
              )))
        ],
      ),
    );
  }
}


// Widget unitBasicItemWidget ({
//   required String label
// })
//   => Padding(
//     padding: const EdgeInsets.symmetric(
//       vertical: 10
//     ),
//     child:Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: AppStyles.normalBlueTextStyle,
//       ),
//       const SizedBox(height: 5,),
//       const Divider(thickness: 0.7, color: Colors.grey,)
//     ],
//   ));



  class UnitBasicItemWidget extends StatefulWidget{
    final String label;
    final String details;
    const UnitBasicItemWidget({
      super.key,
      required this.label,
      required this.details
    });


    @override
    _unitBasicItemWidgetState createState () => _unitBasicItemWidgetState();
  }


  class _unitBasicItemWidgetState extends State<UnitBasicItemWidget>{

    bool isExpanded = false;

    @override
    Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child:Text(
          widget.label,
          style: AppStyles.normalBlueTextStyle,
        )),
        const SizedBox(height: 5,),
        const Divider(thickness: 0.7, color: Colors.grey,),
        isExpanded? SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.details,
                style: AppStyles.normalBlackTextStyle,
              ),
              const SizedBox(height: 2,),
              TextButton(
                onPressed: (){
                  setState(() {
                    isExpanded = false;
                  });
                }, 
                child: const Text(
                  "Close Reading",
                  style: AppStyles.normalBlueTextStyle,
                ),)
            ],
          ),
        ):const SizedBox()
      ],
    ));
    }

  }