import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/screens/login_screen.dart';
import 'package:gfg_project/screens/login_screen_main.dart';
import 'package:gfg_project/screens/onboarding_screen.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/screens/splash_screen.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
        initialRoute: RoutesClass.loginScreen,
        getPages: RoutesClass.routes,
    );
  }
}
