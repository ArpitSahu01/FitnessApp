import 'package:flutter/material.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

class ProfileDetails extends StatelessWidget {

  final String upText;
  final String downText;
  const ProfileDetails({required this.upText,required this.downText,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0.wp),
          color: Colors.white,
          // boxShadow: const [ BoxShadow(
          //     offset: Offset(1,2),
          //     blurRadius: 0.5,
          //     spreadRadius: 0.1,
          //     color: Colors.grey
          // ),],
      ),
      child: Column(
        children: [
          Text(upText,style: kPoppinsBold.copyWith(fontSize: 12.0.sp,color: gradientColorDark),),
          SizedBox(height: 0.5.hp,),
          Text(downText,style: kPoppinsMedium.copyWith(fontSize: 10.0.sp),),
        ],
      ),
    );
  }
}
