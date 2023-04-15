import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfg_project/models/user_model.dart';

class DataDisplayController extends GetxController{
  UserModel userModel;
  DataDisplayController(this.userModel);

  static DataDisplayController instance = Get.find();

  double getBMI(){
    double height = userModel.height as double;
    double weight = userModel.weight as double;
    double bmi = height/(weight * weight);
    return bmi;
  }

}