import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

class ProfileItem extends StatelessWidget {
  final String itemName;
  final String iconUrl;
  const ProfileItem({required this.itemName,required this.iconUrl,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(iconUrl,),
        const Spacer(flex: 1,),
        Text(itemName,style: kPoppinsMedium.copyWith(fontSize: 12.0.sp,color: textFieldIconColor),),
        const Spacer(flex: 10,),
        const Icon(Icons.arrow_forward_ios,color: textFieldIconColor,)
      ],
    );
  }
}
