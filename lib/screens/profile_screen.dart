import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:gfg_project/widgets/profile_details.dart';
import 'package:gfg_project/widgets/profile_items.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Column(
              children: [
                SizedBox(height: 2.0.hp,),
                // heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/otherScreens/back_button.svg",width: 10.0.wp),
                    const Spacer(flex: 1,),
                    Text("Profile",style: kPoppinsBold.copyWith(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w900,
                    ),),
                    const Spacer(flex: 2,),
                  ],
                ),
                SizedBox(height: 2.0.hp,),
                // profile edit
                Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage("assets/otherScreens/profilePic.png"),radius: 8.0.wp,),
                    const Spacer(),
                    Text("Stefani Wong",style: kPoppinsBold.copyWith(fontSize: 4.0.wp),),
                    const Spacer(flex: 5,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesClass.getEditProfileScreen());
                      },
                      child: Container(
                        width: 24.0.wp,
                        height: 10.0.wp,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              gradientColorDark,
                              gradientColorLight
                            ]
                          ),
                          borderRadius:BorderRadius.circular(10.0.wp)
                        ),
                        child: Text("Edit",style: kPoppinsSemiBold.copyWith(fontSize: 10.0.sp,color: Colors.white),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 2.0.hp,),
                // user health details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                     ProfileDetails(upText: "180cm",downText: "Height",),
                     ProfileDetails(upText: "65kg",downText: "Weight",),
                     ProfileDetails(upText: "22yo",downText: "Age",),
                  ],
                ),
                SizedBox(height: 4.0.hp,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp,vertical: 4.0.wp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0.wp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account",style: kPoppinsBold.copyWith(fontSize: 15.0.sp,fontWeight: FontWeight.w900),),
                      SizedBox(height: 4.0.wp,),
                      const ProfileItem(itemName: "Personal Data", iconUrl: "assets/profileScreen/Profile.svg"),
                      SizedBox(height: 2.0.wp,),
                      const ProfileItem(itemName: "Achievement", iconUrl: "assets/profileScreen/Achievement.svg"),
                      SizedBox(height: 2.0.wp,),
                      const ProfileItem(itemName: "Activity Tracker", iconUrl: "assets/profileScreen/ActivityTracker.svg"),
                      SizedBox(height: 2.0.wp,),
                      const ProfileItem(itemName: "BMI Calculator", iconUrl: "assets/profileScreen/Calculator.svg"),
                    ],
                  ),
                ),
                SizedBox(height: 4.0.hp,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp,vertical: 4.0.wp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0.wp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Notification",style: kPoppinsBold.copyWith(fontSize: 15.0.sp,fontWeight: FontWeight.w900),),
                      SizedBox(height: 4.0.wp,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/profileScreen/Notif.svg",),
                          const Spacer(flex: 1,),
                          Text("Pop-up Notification",style: kPoppinsMedium.copyWith(fontSize: 12.0.sp,color: textFieldIconColor),),
                          const Spacer(flex: 10,),
                            Transform.scale(
                              scale: 0.2.wp,
                              child: CupertinoSwitch(
                                 trackColor: gradientColorDark,
                                 activeColor: gradientColorDark,
                                 value: _toggle,
                                 onChanged: (value){
                                   setState(() {
                                     _toggle = !_toggle;
                                   });
                                 },
                               ),
                            ),

                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp,vertical: 4.0.wp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0.wp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Other",style: kPoppinsBold.copyWith(fontSize: 15.0.sp,fontWeight: FontWeight.w900),),
                      SizedBox(height: 4.0.wp,),
                      const ProfileItem(itemName: "Contact Us", iconUrl: "assets/profileScreen/Profile.svg"),
                      SizedBox(height: 2.0.wp,),
                      const ProfileItem(itemName: "Privacy Policy", iconUrl: "assets/profileScreen/Achievement.svg"),
                      SizedBox(height: 2.0.wp,),
                      const ProfileItem(itemName: "Settings", iconUrl: "assets/profileScreen/ActivityTracker.svg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
