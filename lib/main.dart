import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/controllers/data_display_controller.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gfg_project/screens/login_screen.dart';
import 'package:gfg_project/screens/login_screen_main.dart';
import 'package:gfg_project/screens/onboarding_screen.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().then((value) {

    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
        initialRoute: RoutesClass.splashScreen,
        getPages: RoutesClass.routes,
    );
  }
}
