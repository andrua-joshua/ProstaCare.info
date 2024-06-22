import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';

class DRadioOptions extends StatefulWidget{
  final List<String> options;
  final Function(int) selected;
  final Color activeBgColor;
  const DRadioOptions({
    super.key,
    required this.options,
    required this.selected,
    required this.activeBgColor
  });

  @override
  _DRadioOptionsState createState () => _DRadioOptionsState();

}

class _DRadioOptionsState extends State<DRadioOptions>{

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context, constraints) {
        double width = constraints.maxWidth*0.33;
        return Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3, (index) => SizedBox(
                    width: width,
                    child:unitItem(widget.options[index], index))),
              ),
            ),
            // const SizedBox(height: 5,),
            // unitItem(widget.options[2], 2)
          ],
        );
      },);
  }


  Widget unitItem(
    String label,
    int index
  ) => GestureDetector(
    onTap: (){
      widget.selected(index);
      setState(() {
        activeIndex = index;
      });
    },
    child: Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: index== activeIndex? widget.activeBgColor:null,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          // padding: const EdgeInsets.all(1),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child:Text(
          label,
          style: AppStyles.smallBlackTextStyle,))
      ],
    ),
  );
}



class ImageTitleCard extends StatefulWidget{
  final String imageUrl;
  final String title;
  final TextStyle textStyle;
  final double width;
  final double height;

  const ImageTitleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.textStyle,
    required this.width,
    required this.height
  });


  @override
  _imageTitleCardState createState() => _imageTitleCardState();

}


class _imageTitleCardState extends State<ImageTitleCard>{

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
          width: 1
        )
      ),

      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: widget.height*0.7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.imageUrl))
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:Text(
              widget.title,
              style: widget.textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,)))
        ],
      ),
    );
  }
}