import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/providers/user_provider.dart';
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

  bool isloading = false;

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
      body: Consumer<UserProvider>(
        builder: (context, valueU, child) => SafeArea(
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
                    onClick: (){
                      _login(valueU);
                    }),
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
          ),)),),
    );
  }


  Future<void> _login(
    UserProvider userProvider
  )async{
    setState(() {
      isloading = true;
    });
    switch(activeIndex){
      case 0:
        final res = await userProvider.userRespositoryApi.loginAsPatient(
          email: _emailController.text, 
          password: _passwordController.text,
          provider: userProvider);
        
        if(res==1){
          final user = await userProvider.userRespositoryApi.getPatientProfile(
            token: userProvider.token);
          if(user!=null){
            userProvider.patientModule = user;
            userProvider.notifyAll();
            Navigator.pushNamed(context, RouteGenerator.accountDetailsScreen);
          }else{
            Fluttertoast.showToast(
              msg: "Failed to fetch user Profile");
          }
        }else if(res == 0){
          Fluttertoast.showToast(
              msg: "User not found");
        }else{
          Fluttertoast.showToast(
              msg: "Login failed.\n Check your  internet and try again");
        }
        break;

      case 1:
        final res = await userProvider.userRespositoryApi.loginAsDoctor(
          email: _emailController.text, 
          password: _passwordController.text,
          provider: userProvider);
        
        if(res==1){
          final user = await userProvider.userRespositoryApi.getDoctorProfile(
            token: userProvider.token);
          if(user!=null){
            userProvider.doctorModule = user;
            userProvider.notifyAll();
            Navigator.pushNamed(context, RouteGenerator.accountDetailsScreen);
          }else{
            Fluttertoast.showToast(
              msg: "Failed to fetch user Profile");
          }
        }else if(res == 0){
          Fluttertoast.showToast(
              msg: "User not found");
        }else{
          Fluttertoast.showToast(
              msg: "Login failed.\n Check your  internet and try again");
        }
        break;
      case 2:

        final res = await userProvider.userRespositoryApi.loginAsAdmin(
          email: _emailController.text, 
          password: _passwordController.text,
          provider: userProvider);
        
        if(res==1){
          final user = await userProvider.userRespositoryApi.getAdminProfile(
            token: userProvider.token);
          if(user!=null){
            userProvider.adminModule = user;
            userProvider.notifyAll();
            Navigator.pushNamed(context, RouteGenerator.accountDetailsScreen);
          }else{
            Fluttertoast.showToast(
              msg: "Failed to fetch user Profile");
          }
        }else if(res == 0){
          Fluttertoast.showToast(
              msg: "User not found");
        }else{
          Fluttertoast.showToast(
              msg: "Login failed.\n Check your  internet and try again");
        }
        break;
    }

    setState(() {
      isloading = false;
    });
  }
}