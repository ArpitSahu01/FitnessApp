import 'package:get/get.dart';

class AuthController extends GetxController{

  Rx<bool> isLoading = false.obs;

  // making authcontroller globally accessible
  static AuthController instance = Get.find();

  

}