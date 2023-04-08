import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/sign_in_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
               hintText: "Name",
               icon: Icons.supervisor_account,
             ),
            SizedBox(
              height: 2.0.hp,
            ),
            CustomTextField(
              hintText: "Email ID",
              icon: Icons.email,
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            CustomTextField(
              hintText: "Password",
              icon: Icons.lock,
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            CustomTextField(
              hintText: "Confirm Password",
              icon: Icons.lock,
            ),
            
            SizedBox(
              height: 2.0.hp,
            ),

            const SignInButton(
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
                Text("Login",style: kPoppinsMedium.copyWith(
                  fontSize: 10.0.sp,
                  color: gradientColorDark,
                ),),
              ],)
          ],
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
