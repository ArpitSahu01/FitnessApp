import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String userName = "";
  int currentScreen = 0;
  final getStorage = GetStorage();

  @override
  void initState() {
    AuthController.instance.getUserDetails().then((user) => setState((){userName = user.userName;}));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreen,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: (value){
          setState(() {
            currentScreen = value;
          });
        },
        
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigationBarIcon/home_icon.svg",color: currentScreen == 0 ? null: Colors.black,),label: "Home",),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigationBarIcon/trainning_icon.svg",color: currentScreen == 1 ? null: Colors.black,),label: "Training",),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigationBarIcon/meal_icon.svg",color: currentScreen == 2 ? null: Colors.black,),label: "Meal"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigationBarIcon/profile_icon.svg",color: currentScreen == 3 ? null: Colors.black,),label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomeScreen",style: kPoppinsSemiBold.copyWith(fontSize: 10.0.wp),),
              Text("Hello! $userName"),
              ElevatedButton(onPressed: (){
                AuthController.instance.signOut();
              }, child: Text("LogOut")),
              ElevatedButton(onPressed: () async{
                await getStorage.remove("isFirstAuth");
              }, child: Text("Reset OnBoardingScreen")),
            ],
          ),
        ),
      ),
    );
  }
}
