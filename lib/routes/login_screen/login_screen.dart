import 'package:flutter/material.dart';
import 'package:sample_app/route.dart';
import 'package:sample_app/utils/app_colors.dart';
import 'package:sample_app/utils/app_styles.dart';
import 'package:sample_app/utils/app_text_input_fields.dart';
import 'package:sample_app/utils/buttons.dart';
import 'package:sample_app/utils/cutom_widgets.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  _loginScreenState createState () => _loginScreenState();

}


class _loginScreenState extends State<LoginScreen>{

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.softWhiteColor,
      ),
      body: SafeArea(
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
                    "Welcome Back",
                    style: AppStyles.bigBoldBlackTextStyle,),
                  const SizedBox(height: 10,),
                  const Text(
                    "Welcome back fam, login using your email and password.",
                    style: AppStyles.normalGreyTextStyle,),
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

                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child: DRadioOptions(
                    options: const ["Patient", "Doctor", "Admin"], 
                    selected: (x){
                      setState(() {
                        activeIndex = x;
                      });
                    }, 
                    activeBgColor: AppColors.primaryColor),),

                  const SizedBox(height: 70,),
                  DSolidButton(
                    label: "Login", 
                    btnHeight: 45, 
                    bgColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalWhiteTextStyle, 
                    onClick: (){}),
                  const SizedBox(height: 10,),
                  activeIndex==0? DOutlinedButton(
                    label: "SignUp", 
                    btnHeight: 45, 
                    borderColor: AppColors.greyColor, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalBoldGreyTextStyle, 
                    onClick: (){
                      Navigator.pushNamed(context, RouteGenerator.patientSignupScreen);
                    }):const SizedBox()

                ],
              )),
          ),)),
    );
  }
}