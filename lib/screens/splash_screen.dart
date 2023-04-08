import 'package:flutter/material.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text: TextSpan(
              text: "Fit",
              style: kPoppinsSemiBold.copyWith(
                color: textSplashColor1,
                fontSize: 10.0.wp,
                fontWeight: FontWeight.w800
              ),
              children: [
                TextSpan(
                  text: "Zo",
                  style: kPoppinsSemiBold.copyWith(
                    color: textSplashColor2,
                    fontSize: 10.0.wp,
                    fontWeight: FontWeight.w800
                  ),
                )
              ]
            )),
            Center(
              child: Text(
                "Fitness app for Generation Z",
                style: kPoppinsSemiBold.copyWith(
                color: textSplashColor1,
                fontSize: 5.0.wp,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
