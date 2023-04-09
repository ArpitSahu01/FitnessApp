import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gfg_project/screens/login_screen.dart';
import 'package:gfg_project/screens/login_screen_main.dart';
import 'package:gfg_project/screens/onboarding_screen.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
        initialRoute: RoutesClass.splashScreen,
        getPages: RoutesClass.routes,
    );
  }
}
