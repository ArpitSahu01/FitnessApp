import 'package:flutter/material.dart';
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
  @override
  void initState() {
    AuthController.instance.getUserDetails().then((user) => setState((){userName = user.userName;}));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
    );
  }
}
