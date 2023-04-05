import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

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
            Text("Register",style: kPoppinsMedium.copyWith(
              fontSize: 12.0.sp,
              color: gradientColorDark,
            ),),
          ],)
        ],
      ),
    );
  }
}




class SignInButton extends StatelessWidget {
  final String title;
  final String? urlPath;
  final Color color;
  final Color foregroundColor;
  final Gradient? gradient;

  const SignInButton(
      {required this.title,
       this.urlPath,
      required this.color,
      this.foregroundColor = TextBlackColor,
      this.gradient,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.wp,
      height: 6.0.hp,
      decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          border: color == Colors.white
              ? Border.all(color: LightBlackColor.withOpacity(0.3))
              : null,
          borderRadius: BorderRadius.all(Radius.circular(20.0.wp))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if(urlPath != null)
          Image.asset(
            urlPath!,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: urlPath == null ? const EdgeInsets.all(0): EdgeInsets.only(right: 10.0.wp),
            child: Text(
              title,
              style: kPoppinsMedium.copyWith(
                fontSize: 12.0.sp,
                color: foregroundColor,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
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
