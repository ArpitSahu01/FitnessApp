import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:gfg_project/widgets/custom_textfield.dart';

import '../widgets/sign_in_button.dart';

class LoginScreenMain extends StatefulWidget {
  const LoginScreenMain({Key? key}) : super(key: key);

  @override
  State<LoginScreenMain> createState() => _LoginScreenMainState();
}

class _LoginScreenMainState extends State<LoginScreenMain> {

  final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.0.hp,),
                Center(child: Image.asset("assets/login/login_image_main.png")),
                SizedBox(height: 4.0.hp,),
                Text("Hey There",style: kPoppinsRegular.copyWith(
                  fontSize: 5.0.wp,
                ),),
                Text("Welcome Back",style: kPoppinsBold.copyWith(
                  fontSize: 6.0.wp,
                ),),
                SizedBox(height: 4.0.hp,),
                CustomTextField(hintText: "Emai", icon: Icons.email,validator: (value){
                  final bool _isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                  if(!_isEmailValid){
                    return "Please enter a valid email";
                  }
                  return null;
                },),
                SizedBox(height: 2.0.hp,),
                CustomTextField(hintText: "Password", icon: Icons.lock,isSuffixIcon: true,validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return "Enter a valid password";
                  }else if(value.length<= 6){
                    return "Please enter password greater then 6 letters";
                  }
                  return null;
                },),
                SizedBox(height: 2.0.hp,),
                 SignInButton(
                  title: "SignIn",
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        gradientColorLight,
                        gradientColorDark,
                      ]
                  ),
                  onTap: (){
                    if(_formKey.currentState!.validate()){

                    }
                  },
                ),
                SizedBox(height: 2.0.hp,),

                Text("Forgot your password?",style: kPoppinsMedium.copyWith(
                  color: textFieldIconColor,
                  decoration: TextDecoration.underline
                ),),
                SizedBox(height: 2.0.hp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLogoContianer(imageUrl: "assets/login/google_logo.png",),
                    SizedBox(width:6.0.wp,),
                    CustomLogoContianer(imageUrl: "assets/login/facebook_logo_2.png",)
                  ],
                ),
                SizedBox(height: 2.0.hp,),
                CustomDivider(),
                SizedBox(height: 2.0.hp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account yet?",style: kPoppinsMedium.copyWith(
                      fontSize: 10.0.sp,
                      color: LightBlackColor.withOpacity(0.6),
                    ),),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesClass.signUpScreen);
                      },
                      child: Text(" Register",style: kPoppinsMedium.copyWith(
                        fontSize: 10.0.sp,
                        color: gradientColorDark,
                      ),),
                    ),
                  ],)

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomLogoContianer extends StatelessWidget {

  final String imageUrl;
  final Color? color;
  const CustomLogoContianer({required this.imageUrl,this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0.wp,
      width: 15.0.wp,
       padding: EdgeInsets.all(4.0.wp),
      decoration: BoxDecoration(
        border: Border.all(color: textFieldIconColor.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(4.0.wp),
      ),
      child: Image.asset(imageUrl,color: color,fit: BoxFit.contain,),
    );
  }
}

