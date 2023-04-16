import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../widgets/sign_in_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.0.hp,),
                // heading
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                        child: const Icon(Icons.arrow_back_ios_new_rounded),),
                      const Spacer(),
                      Text("Personal Data",style: kPoppinsSemiBold.copyWith(
                      fontSize: 15.0.sp,
                    ),),
                      const Spacer(),
                  ],
                ),
                SizedBox(height: 6.0.hp,),
                ProfileTextField(title: "Name",),
                SizedBox(height: 1.0.hp,),
                ProfileTextField(title: "Gender",),
                SizedBox(height: 1.0.hp,),
                ProfileTextField(title: "Height",),
                SizedBox(height: 1.0.hp,),
                ProfileTextField(title: "Weight",),
                SizedBox(height: 1.0.hp,),
                ProfileTextField(title: "Age",),
                SizedBox(height: 25.0.hp,),
                SignInButton(
                  title: "Start Workout",
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        gradientColorLight,
                        gradientColorDark,
                      ]
                  ),
                  onTap: () {
                  },
                ),
                SizedBox(height: 2.0.hp,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ProfileTextField extends StatelessWidget {
  final String title;
  const ProfileTextField({required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.0.wp),
          child: Text(title,style: kPoppinsMedium.copyWith(fontSize: 12.0.sp),),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 6.0.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0.wp),
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  gradientColorLight,
                  gradientColorDark,
                ]
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 4.0.wp,right: 4.0.wp,bottom: 2.0.wp),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}

