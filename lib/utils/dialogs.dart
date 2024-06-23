import 'package:flutter/material.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/app_text_input_fields.dart';
import 'package:sample_app/utils/buttons.dart';

class CreateGroupDialog extends StatefulWidget{
  const CreateGroupDialog({super.key});


  @override
  _createGroupState createState ()=> _createGroupState();
}



class _createGroupState  extends State<CreateGroupDialog>{

  late final TextEditingController _titleController;
  late final TextEditingController _groupLinkController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _groupLinkController = TextEditingController();
    _descriptionController = TextEditingController();

  }

  @override
  void dispose() {
    _titleController.dispose();
    _groupLinkController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Center(
            child:Text(
            "Add Group",
            style: AppStyles.bigBoldBlackTextStyle,
            )),
          const SizedBox(height: 20,),
          const Text(
            "Title",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Enter group title", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _titleController),

          const SizedBox(height: 20,),
          const Text(
            "Link",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Enter Group link", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _groupLinkController),


          const SizedBox(height: 20,),
          const Text(
            "Description",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Short group description", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _descriptionController),

          const SizedBox(height: 50,),

          DSolidButton(
            label: "Add Group", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){})
        ],
      )
    );
  }
}







class AddArticleDialog extends StatefulWidget{
  const AddArticleDialog({super.key});


  @override
  _AddArticleDialogState createState ()=> _AddArticleDialogState();
}



class _AddArticleDialogState  extends State<AddArticleDialog>{

  late final TextEditingController _titleController;
  late final TextEditingController _articleLinkController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _articleLinkController = TextEditingController();
    _descriptionController = TextEditingController();

  }


  @override
  void dispose() {
    _titleController.dispose();
    _articleLinkController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Center(
            child:Text(
            "Add Article",
            style: AppStyles.bigBoldBlackTextStyle,
            )),
          const SizedBox(height: 20,),
          const Text(
            "Title",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Enter Article title", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _titleController),

          const SizedBox(height: 20,),
          const Text(
            "Link",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Enter Article link", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _articleLinkController),


          const SizedBox(height: 20,),
          const Text(
            "Description",
            style: AppStyles.normalBlackTextStyle,
          ),

          DSolidTextInputField(
            hintText: "Short group description", 
            hintTextStyle: AppStyles.normalGreyTextStyle, 
            valueTextStyle: AppStyles.normalBlackTextStyle, 
            bgColor: AppColors.softWhiteColor, 
            borderRadius: 20, 
            btnHeight: 45, 
            controller: _descriptionController),

          const SizedBox(height: 50,),

          DSolidButton(
            label: "Add Article", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){})
        ],
      )
    );
  }
}






class GroupViewDialog extends StatefulWidget{
  final String groupTitle;
  final String groupDescription;
  final String groupLink;
  const GroupViewDialog({
    super.key,
    required this.groupTitle,
    required this.groupDescription,
    required this.groupLink
    });


  @override
  _GroupViewDialogState createState ()=> _GroupViewDialogState();
}



class _GroupViewDialogState  extends State<GroupViewDialog>{

  @override
  void initState() {
    super.initState();

  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child:Text(
              widget.groupTitle,
              style: AppStyles.bigBoldBlackTextStyle,
              )),
          const SizedBox(height: 20,),
          const Text(
            "Link",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          Text(
            widget.groupLink,
            style: AppStyles.normalBlackTextStyle,
          ),
          const SizedBox(height: 20,),
          const Text(
            "Description",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          Text(
            widget.groupDescription,
            style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(height: 50,),

          DSolidButton(
            label: "Join Group", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){})
        ],
      )
    );
  }
}




class BookingViewDialog extends StatefulWidget{
  final String doctorName;
  final String doctorEmail;
  final String date;
  final String time;
  final String coverImg;
  const BookingViewDialog({
    super.key,
    required this.doctorName,
    required this.doctorEmail,
    required this.date,
    required this.time,
    required this.coverImg
    });


  @override
  _BookingViewDialogState createState ()=> _BookingViewDialogState();
}



class _BookingViewDialogState  extends State<BookingViewDialog>{

  @override
  void initState() {
    super.initState();

  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.coverImg),
                ),

                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: AppStyles.normalBoldBlackTextStyle,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.doctorEmail,
                        style: AppStyles.smallBlackTextStyle,
                      ),
                    ],
                  ))
              ],
            ),
          ),

          const SizedBox(height: 10,),
          const Divider(thickness: 0.4, color: Colors.grey,),
          const Text(
            "Schedule Date",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.date,
                    style: AppStyles.normalBlackTextStyle,
                  ),),

                const SizedBox(width: 10,),
                Text(
                  widget.time,
                  style: AppStyles.normalBoldBlackTextStyle,
                ),
                const SizedBox(height: 5,),
              ],
            ),
          ),

          const SizedBox(height: 60,),

          DSolidButton(
            label: "Cancel", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){}),
          const SizedBox(height: 20,),
        ],
      )
    );
  }
}




class PatientViewDialog extends StatefulWidget{
  final String patientName;
  final String patientEmail;
  final String nin;
  final String phone;
  final String coverImg;
  const PatientViewDialog({
    super.key,
    required this.patientName,
    required this.patientEmail,
    required this.nin,
    required this.phone,
    required this.coverImg
    });


  @override
  _PatientViewDialogState createState ()=> _PatientViewDialogState();
}



class _PatientViewDialogState  extends State<PatientViewDialog>{

  @override
  void initState() {
    super.initState();

  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.coverImg),
                ),

                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.patientName,
                        style: AppStyles.normalBoldBlackTextStyle,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.patientEmail,
                        style: AppStyles.smallBlackTextStyle,
                      ),
                    ],
                  ))
              ],
            ),
          ),

          const SizedBox(height: 10,),
          const Divider(thickness: 0.4, color: Colors.grey,),
          const Text(
            "Phone",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          Text(
            widget.phone,
            style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(height: 20,),
          const Text(
            "Nin",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          Text(
            widget.nin,
            style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(height: 60,),

          DSolidButton(
            label: "Close", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){}),
          const SizedBox(height: 20,),
        ],
      )
    );
  }
}





class DoctorViewDialog extends StatefulWidget{
  final String doctorName;
  final String doctorEmail;
  final String nin;
  final String phone;
  final String location;
  final String coverImg;
  const DoctorViewDialog({
    super.key,
    required this.doctorName,
    required this.doctorEmail,
    required this.nin,
    required this.phone,
    required this.location,
    required this.coverImg
    });


  @override
  _DoctorViewDialogState createState ()=> _DoctorViewDialogState();
}



class _DoctorViewDialogState  extends State<DoctorViewDialog>{

  @override
  void initState() {
    super.initState();

  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.coverImg),
                ),

                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: AppStyles.normalBoldBlackTextStyle,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.doctorEmail,
                        style: AppStyles.smallBlackTextStyle,
                      ),
                    ],
                  ))
              ],
            ),
          ),

          const SizedBox(height: 10,),
          const Divider(thickness: 0.4, color: Colors.grey,),
          const Text(
            "Phone",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          Text(
            widget.phone,
            style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(height: 20,),
          const Text(
            "Nin",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          Text(
            widget.nin,
            style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(height: 20,),
          const Text(
            "Location",
            style: AppStyles.normalBoldBlackTextStyle,
          ),
          const SizedBox(height: 3,),
          SizedBox(
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.red, size: 20,),
                const SizedBox(width: 10,),
                Text(
                  widget.location,
                  style: AppStyles.normalBlackTextStyle,
                ),
              ],
            ),
          ),

          const SizedBox(height: 60,),

          DSolidButton(
            label: "Book Session", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick: (){}),
          const SizedBox(height: 20,),
        ],
      )
    );
  }
}