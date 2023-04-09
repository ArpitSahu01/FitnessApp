import 'package:flutter/material.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomeScreen",style: kPoppinsSemiBold.copyWith(fontSize: 10.0.wp),),
              ElevatedButton(onPressed: (){
                AuthController.instance.signOut();
              }, child: Text("LogOut")),
            ],
          ),
        ),
      ),
    );
  }
}
