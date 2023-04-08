
import 'package:flutter/material.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final String? urlPath;
  final void Function()? onTap;
  final Color? color;
  final Color foregroundColor;
  final Gradient? gradient;

  const SignInButton(
      {required this.title,
        this.urlPath,
        this.onTap,
        this.color,
        this.foregroundColor = TextBlackColor,
        this.gradient,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

