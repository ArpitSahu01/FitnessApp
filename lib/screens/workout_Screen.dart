import 'package:flutter/material.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:get/get.dart';

import '../widgets/sign_in_button.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {

  List<String> weekDays = ["Mon","Tue","Wed","Thus","Fri","Sat","Sun"];

  List<Map<String,String>> data = [
    {
      "imageUrl":"assets/otherScreens/workScreen1.png",
      "title":"Warm Up",
      "body":"The purpose of warming up before physical activity is to prepare mentally and physically for your chosen activity. Warming up increases your heart rate and therefore your blood flow. This enables more oxygen to reach your muscles"
    },
    {
      "imageUrl":"assets/otherScreens/workScreen2.png",
      "title":"Lunges",
      "body":"Lunges are a popular strength training exercise among people wanting to strengthen, sculpt, and tone their bodies, while also improving overall fitness and enhancing athletic performance"
    },
    {
      "imageUrl":"assets/otherScreens/workScreen3.png",
      "title":"Squats",
      "body":"A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up"
    },
    {
      "imageUrl":"assets/otherScreens/workScreen4.png",
      "title":"Glute Bridge",
      "body":" A glute bridge is a physical exercise that helps to strengthen the gluteus muscles (located in your buttocks) and hamstrings. Glute bridges are done by laying on your back with both feet planted on the ground and lifting your pelvis. It can help to increase hip flexibility and lower back health."
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Stack(
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.0.hp,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                            child: Icon(Icons.arrow_back_ios_new_sharp)),
                        Spacer(),
                        Column(
                          children: [
                            Text("Workout Plan",style: kPoppinsSemiBold.copyWith(fontSize: 6.0.wp),),
                            Text("your personalised workout plan",style: kPoppinsSemiBold.copyWith(fontSize: 3.0.wp),),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 4.0.hp,),
                    SizedBox(
                      width: 90.0.wp,
                      height: 5.0.hp,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: weekDays.map((day) => Container(
                          width: 20.0.wp,
                          height: 5.0.hp,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 1.0.wp),
                          decoration: BoxDecoration(
                            color: textFieldColor,
                            borderRadius: BorderRadius.circular(2.0.wp)
                          ),
                          child: Text(day),
                        )).toList(),
                      ),
                    ),
                    SizedBox(height: 2.0.hp,),
                    Text("Lower body strength",style: kPoppinsSemiBold.copyWith(fontSize: 5.0.wp),),
                    SizedBox(height: 2.0.hp,),
                    // workout dropdown sheet
                    ExpansionPanelList.radio(
                      children: data.map((value) => ExpansionPanelRadio(
                        value: value["title"].toString(),
                          headerBuilder: (context, isExpanded){
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 2.0.wp),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0.wp),
                              ),
                              child: Image.asset(value["imageUrl"].toString()),
                            ),
                            title: Text(value["title"].toString()),
                          ),
                        );
                      }, body: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0.wp),
                        child: ListTile(
                          title: Text(value["body"].toString()),
                        ),
                      ))).toList(),
                    ),
                    SizedBox(
                      height: 25.0.hp,
                    ),
                    SignInButton(
                      title: "Start Workout",
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            gradientColorLight,
                            gradientColorDark,
                          ]
                      ),
                      onTap: () {
                      },
                    ),
                  ],
                ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}

