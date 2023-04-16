import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/controllers/data_display_controller.dart';
import 'package:gfg_project/models/user_model.dart';
import 'package:get/get.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:gfg_project/widgets/carousel_slider_widget.dart';
import 'package:gfg_project/widgets/community_item.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String userName = "";
  String bmi = "";
  int currentScreen = 0;
  final getStorage = GetStorage();

  @override
  void initState() {
    AuthController.instance.getUserDetails().then((user)  {
      setState((){
        userName = user.userName;
        AuthController.instance.getBMI().then((value) =>
        setState((){
          bmi = value.toString();
          print(bmi);
        })
        );
      });
      DataDisplayController(user);
    });

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
      body: SingleChildScrollView(
         child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Column(
              children: [
                SizedBox(height: 4.0.hp,),

                // Profile Information

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage("assets/otherScreens/homeProfile.png"),radius: 10.0.wp,),
                    SizedBox(width: 2.0.wp,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back,",style: kPoppinsMedium.copyWith(color: textFieldIconColor,fontSize: 15.0.sp),),
                        Text(userName,style: kPoppinsBold.copyWith(color: TextBlackColor,fontSize: 20.0.sp,fontWeight: FontWeight.w900),),
                      ]
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/otherScreens/homeNotification.svg"),
                  ],
                ),

                // Quotes section
                SizedBox(height: 2.0.hp,),
                const CarouselSliderWidget(),

                // Remainder section
                SizedBox(height: 2.0.hp,),
                const RemainderSection(),

                // Statistics section
                SizedBox(height: 2.0.hp,),
                StatisticsSection(bmi: bmi,),

                // workout plan
                SizedBox(height: 2.0.hp,),
                WorkoutSection(),

                //fitness community
                SizedBox(height: 2.0.hp,),
                FitnessSection(),

                // Logout and OnBoarding Screen reset Buttons

                // ElevatedButton(onPressed: (){
                //   AuthController.instance.signOut();
                // }, child: Text("LogOut")),
                // ElevatedButton(onPressed: () async{
                //   await getStorage.remove("isFirstAuth");
                // }, child: Text("Reset OnBoardingScreen")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class RemainderSection extends StatelessWidget {
  const RemainderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Remainder",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
        Card(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.0.wp,vertical: 4.0.wp),
            child: Row(
            children: [
              const CircleAvatar(backgroundColor: Color(0xffDFE6FF),),
              SizedBox(width: 2.0.wp,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Drink 300ml Water",style: kPoppinsSemiBold.copyWith(color: TextBlackColor),),
                  Text("10 minutes ago",style: kPoppinsSemiBold.copyWith(color: TextBlackColor.withOpacity(0.4)),),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
        ),
          ),),

        Card(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.0.wp,vertical: 4.0.wp),
            child: Row(
              children: [
                const CircleAvatar(backgroundColor: Color(0xffF0DEF9),),
                SizedBox(width: 2.0.wp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Eat Snacks",style: kPoppinsSemiBold.copyWith(color: TextBlackColor),),
                    Text("upcoming",style: kPoppinsSemiBold.copyWith(color: TextBlackColor.withOpacity(0.4)),),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert),
              ],
            ),
          ),),
      ],
    );
  }
}


class StatisticsSection extends StatelessWidget {
  String bmi;
   StatisticsSection({required this.bmi,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Statistics",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 35.0.wp,
              height: 35.0.wp,
              padding: EdgeInsets.only(top: 2.0.hp),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SvgPicture.asset("assets/otherScreens/homeShoe.svg"),
                  Text("Calories burnt",style: kPoppinsSemiBold.copyWith(fontSize: 4.0.wp,fontWeight: FontWeight.w700),),
                  Text("18,249",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
              width: 35.0.wp,
              height: 35.0.wp,
              padding: EdgeInsets.only(top: 2.0.hp),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SvgPicture.asset("assets/otherScreens/homeScale.svg"),
                  Text("BMI",style: kPoppinsSemiBold.copyWith(fontSize: 4.0.wp,fontWeight: FontWeight.w700),),
                  Text("24.5",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class WorkoutSection extends StatelessWidget {
  const WorkoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Workout Plan",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
        GestureDetector(
          onTap: (){
            Get.toNamed(RoutesClass.getWorkoutScreen());
          },
          child: Card(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.0.wp,vertical: 4.0.wp),
              child: Row(
                children: [
                   CircleAvatar(backgroundColor: Color(0xffDFE6FF),child: SvgPicture.asset("assets/otherScreens/homeWorkout.svg")),
                  SizedBox(width: 2.0.wp,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Friday",style: kPoppinsSemiBold.copyWith(color: TextBlackColor),),
                      Text("Lower Body Strength",style: kPoppinsSemiBold.copyWith(color: TextBlackColor.withOpacity(0.4)),),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),),
        ),
      ],
    );
  }
}


class FitnessSection extends StatelessWidget {
  const FitnessSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Fitness Community",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp,fontWeight: FontWeight.w700),),
        CommunityItem(imageUrl: "assets/otherScreens/homeFitness1.png",text: "For trainnig long head of bisep curl use inner grip, for shot head use wide grip.",),
        CommunityItem(imageUrl: "assets/otherScreens/homeFitness2.png",text: "Along with exercise nutrition is also a crucial part of our body. ",),

      ],
    );
  }
}
