import 'package:get/get.dart';
import 'package:gfg_project/screens/home_screen.dart';
import 'package:gfg_project/screens/login_screen_main.dart';
import 'package:gfg_project/screens/onboarding_screen.dart';
import 'package:gfg_project/screens/profile_screen.dart';
import 'package:gfg_project/screens/signUp_screen.dart';
import 'package:gfg_project/screens/splash_screen.dart';
import 'package:gfg_project/screens/user_data_screen.dart';
import 'package:gfg_project/screens/workout_Screen.dart';


class RoutesClass{

  static String home = "/";
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen_main";
  static String signUpScreen = "/signUp_screen";
  static String onBoardingScreen = "/onBoarding_screen";
  static String userDataScreen = "/user_data_screen";
  static String profileScreen = "/profile_screen";
  static String workoutScreen = "/workoutScreen";

  static String getHomeRoute()=> home;
  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getUserDataScreen() => userDataScreen;
  static String getProfileScreen() => profileScreen;
  static String getOnBoardingScreen() => onBoardingScreen;
  static String getWorkoutScreen() => workoutScreen;


  static List<GetPage> routes = [
    GetPage(name: home, page: ()=> const HomeScreen(),),
    GetPage(name: splashScreen, page: ()=>const SplashScreen()),
    GetPage(name: loginScreen, page: ()=> const LoginScreenMain()),
    GetPage(name: signUpScreen, page: ()=> const SignUpScreen()),
    GetPage(name: onBoardingScreen, page: ()=> const OnBoaridngScreen()),
    GetPage(name: userDataScreen, page: ()=>const UserDataScreen()),
    GetPage(name: profileScreen, page: ()=> const ProfileScreen()),
    GetPage(name: onBoardingScreen, page: ()=> const OnBoaridngScreen()),
    GetPage(name: workoutScreen, page: ()=>const WorkoutScreen()),
  ];


}