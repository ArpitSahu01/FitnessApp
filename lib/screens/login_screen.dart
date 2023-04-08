import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';
import '../widgets/cutom_divider.dart';
import '../widgets/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Get.width / 100 * 80,
              child: Image.asset(
                "assets/login/login_image.png",
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
                "Just Relax and start your journey with us",
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
          const SignInButton(
            title: "Continue with Google",
            urlPath: "assets/login/google_logo.png",
            color: Colors.white,
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          const SignInButton(
            title: "Continue with facebook",
            urlPath: "assets/login/facebook_logo.png",
            color: facebookLogoColor,
            foregroundColor: Colors.white,
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          CustomDivider(),
          SizedBox(
            height: 2.0.hp,
          ),

          const SignInButton(
            title: "Sign in with password",
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
            Text("Don't have an account yet?",style: kPoppinsMedium.copyWith(
              fontSize: 12.0.sp,
              color: LightBlackColor.withOpacity(0.6),
            ),),
            Text(" Register",style: kPoppinsMedium.copyWith(
              fontSize: 12.0.sp,
              color: gradientColorDark,
            ),),
          ],)
        ],
      ),
    );
  }
}

