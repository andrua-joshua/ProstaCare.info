import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/bloc/modules/patient_module.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/app_text_input_fields.dart';
import 'package:sample_app/utils/buttons.dart';

class PatientSignupScreen extends StatefulWidget{
  const PatientSignupScreen({super.key});

  @override
  _PatientSignupScreenState createState () => _PatientSignupScreenState();

}


class _PatientSignupScreenState extends State<PatientSignupScreen>{

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _fullnameController;
  late final TextEditingController _ageController;
  late final TextEditingController _phoneController;
  late final TextEditingController _genderController;
  late final TextEditingController _ninController;

  int activeIndex = 0;
  bool isloading = false;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fullnameController = TextEditingController();
    _ageController = TextEditingController();
    _phoneController = TextEditingController();
    _genderController = TextEditingController();
    _ninController = TextEditingController();


  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _ninController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.softWhiteColor,
      ),
      body: Consumer<UserProvider>(
        builder: 
          (context, valueU, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60,),
                  const Text(
                    "Create account",
                    style: AppStyles.bigBoldBlackTextStyle,),
                  const SizedBox(height: 10,),
                  const Text(
                    "Create your account with us to get the access to all the unlimited service.",
                    style: AppStyles.normalGreyTextStyle,),
                  const SizedBox(height: 25,),
                  const Text(
                    "Full Name",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Full name", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.text,
                    controller: _fullnameController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Email",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Email", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Phone",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Phone", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.phone,
                    controller: _phoneController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Gender",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Gender", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.text,
                    controller: _genderController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Age",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Age", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.number,
                    controller: _ageController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Student No.",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "Student number", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    keyboardType: TextInputType.number,
                    controller: _ninController),
                  const SizedBox(height: 25,),
                  const Text(
                    "Password",
                    style: AppStyles.smallBoldBlackTextStyle,),
                  DOutlinedTextInputField(
                    hintText: "password", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    borderColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    obscureText: true,
                    btnHeight: 45, 
                    controller: _passwordController),

                  // const SizedBox(height: 10,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10
                  //   ),
                  //   child: DRadioOptions(
                  //   options: const ["Patient", "Doctor", "Admin"], 
                  //   selected: (x){
                  //     setState(() {
                  //       activeIndex = x;
                  //     });
                  //   }, 
                  //   activeBgColor: AppColors.primaryColor),),

                  const SizedBox(height: 70,),
                  DSolidButton(
                    label: "Signup", 
                    btnHeight: 45, 
                    bgColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalWhiteTextStyle, 
                    onClick: (){
                      _signUp(userProvider: valueU);
                    }),
                  const SizedBox(height: 10,),
                  DOutlinedButton(
                    label: "Login", 
                    btnHeight: 45, 
                    borderColor: AppColors.greyColor, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalBoldGreyTextStyle, 
                    onClick: (){
                      Navigator.pushNamed(context, RouteGenerator.loginScreen);
                    }),

                const SizedBox(height: 20,)

                ],
              )),
          ),)),),
    );
  }

  Future<void> _signUp({
    required UserProvider userProvider
  }) async{
    setState(() {
      isloading = true;
    });

    final user = PatientModule(
      id: 0, 
      name: _fullnameController.text, 
      email: _emailController.text, 
      phone: _phoneController.text, 
      age: _ageController.text, 
      nin: _ninController.text, 
      sex: _genderController.text);

    final res = await userProvider.userRespositoryApi.createPatient(
      password: _passwordController.text, 
      pateintModule: user);

    if(res!=null){
      Navigator.pushNamed(
        context, RouteGenerator.loginScreen);
    }else{
      Fluttertoast.showToast(
        msg: "Failed to create Account");
    }

    setState(() {
      isloading = false;
    });
  }
}