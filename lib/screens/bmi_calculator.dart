import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.0.hp,),
              // Heading
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

              //Gender option

            ],
          ),
        ),
      ),
    );
  }
}
