import 'package:get/get.dart';
import 'package:gfg_project/screens/home_screen.dart';
import 'package:gfg_project/screens/login_screen_main.dart';
import 'package:gfg_project/screens/onboarding_screen.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/screens/splash_screen.dart';


class RoutesClass{

  static String home = "/";
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen_main";
  static String signUpScreen = "/signUp_screen";
  static String onBoardingScreen = "/onBoarding_screen";

  static String getHomeRoute()=> home;
  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;


  List<GetPage> routes = [
    GetPage(name: home, page: ()=> const HomeScreen(),),
    GetPage(name: splashScreen, page: ()=>const SplashScreen()),
    GetPage(name: loginScreen, page: ()=> const LoginScreenMain()),
    GetPage(name: signUpScreen, page: ()=> const SignUpScreen()),
    GetPage(name: onBoardingScreen, page: ()=> const OnBoaridngScreen()),
  ];


}