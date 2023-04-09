import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:get/get.dart';
import '../utils/app_utils.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/sign_in_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isLoading = false;
  final _passwordEditingController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.0.hp,
              ),
              Center(
                child: Container(
                  width: Get.width / 100 * 80,
                  child: Image.asset(
                    "assets/signUp/signUpImage.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 6.0.hp,
              ),
              Center(
                child: SizedBox(
                  width: Get.width / 100 * 85,
                  child: Text(
                    "Sign Up",
                    style: kPoppinsMedium.copyWith(
                      fontSize: 20.0.sp,
                      color: TextBlackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0.hp,
              ),
               CustomTextField(
                 textEditingController: _userNameController,
                 hintText: "Name",
                 icon: Icons.supervisor_account,
                 validator: (value){
                   if(value == null || value.trim().isEmpty){
                     return "Enter correct user name";
                   }
                   return null;
                 },
               ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomTextField(
                textEditingController: _emailController,
                hintText: "Email ID",
                icon: Icons.email,
                validator: (value){
                  final bool _isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                  if(!_isEmailValid){
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomTextField(
                textEditingController: _passwordEditingController,
                hintText: "Password",
                icon: Icons.lock,
                isSuffixIcon: true,
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return "Enter correct password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomTextField(
                hintText: "Confirm Password",
                icon: Icons.lock,
                isSuffixIcon: true,
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return "Enter correct password";
                  }else if(_passwordEditingController.text != value){
                    return "Password doen't match";
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 2.0.hp,
              ),

               isLoading ? CircularProgressIndicator():SignInButton(
                title: "Register",
                color: facebookLogoColor,
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      gradientColorLight,
                      gradientColorDark,
                    ]
                ),
                onTap: () async{
                  if(_formKey.currentState!.validate()){
                    final userName = _userNameController.text.trim();
                    final email = _emailController.text.trim();
                    final password = _passwordEditingController.text.trim();
                    setState(() {
                      isLoading = true;
                    });
                    await AuthController.instance.register(email, password, userName);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: 3.0.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? Click here to ",style: kPoppinsMedium.copyWith(
                    fontSize: 10.0.sp,
                    color: LightBlackColor.withOpacity(0.6),
                  ),),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RoutesClass.loginScreen);
                    },
                    child: Text("Login",style: kPoppinsMedium.copyWith(
                      fontSize: 10.0.sp,
                      color: gradientColorDark,
                    ),),
                  ),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}










class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0.1.hp,
          width: 32.0.wp,
          color: LightBlackColor.withOpacity(0.3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
          child: Text(
            "or",
            style: kPoppinsMedium.copyWith(
              fontSize: 12.0.sp,
              color: LightBlackColor.withOpacity(0.6),
            ),
          ),
        ),
        Container(
          height: 0.1.hp,
          width: 32.0.wp,
          color: LightBlackColor.withOpacity(0.3),
        ),
      ],
    );
  }
}
