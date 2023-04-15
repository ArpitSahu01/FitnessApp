import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gfg_project/models/user_model.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final getStorage = GetStorage();
  Rx<bool> isLoading = false.obs;

  // making authcontroller globally accessible
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  final firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      if(getStorage.read("isFirstAuth" )== null){
        Get.offAllNamed(RoutesClass.getOnBoardingScreen());
      }else{
        Get.offAllNamed(RoutesClass.getLoginScreen());
      }
    } else {
      if(getStorage.read("userPersonalData") == null){
        Get.offAllNamed(RoutesClass.getUserDataScreen());
      }else{
        Get.offAllNamed(RoutesClass.getHomeRoute());
      }
    }
  }

  register(String email, String password, String userName) async {
    try {
      final userCredentials = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredentials.user != null) {
        await createUser(UserModel(email: userCredentials.user!.email!, userName: userName,id: userCredentials.user!.uid));
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  signOut() async {
    getStorage.remove("userPersonalData");
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  googleSignIn() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      final userCredentials = await auth.signInWithCredential(credential);
      if(userCredentials.user!.email !=null ) {
        await createUser(UserModel(id: userCredentials.user!.uid, email: userCredentials.user!.email!, userName: userCredentials.user!.displayName!));
      }
    } catch (e) {
      Get.snackbar(
        "About Google Authentication",
        "Error in google signIn",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account failed to login with google",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  facebookSignIn() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final credential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      final userCredential = await auth.signInWithCredential(credential);
      if(userCredential.user!.email != null) {
        createUser(UserModel(id: userCredential.user!.uid, email: userCredential.user!.email!, userName: userCredential.user!.displayName!));
      }
    } catch (e) {
      Get.snackbar(
        "About Facebook Authentication",
        "Error in facebook signIn",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account failed to login with facebook",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }


  createUser(UserModel user) async {
    await firestore
        .collection("Users")
        .doc(_user.value!.uid)
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created",
              snackPosition: SnackPosition.BOTTOM),
        );
  }

  // Fetching details of all a particular user
  Future<UserModel> getUserDetails() async{
      final snapshot = await firestore.collection("Users").where(
          "email", isEqualTo: _user.value!.email).get();
      final userData = snapshot.docs
          .map((e) => UserModel.fromSnapshot(e))
          .single;
      return userData;
    }

    // Fetching details of all the users

  Future<List<UserModel>> allUser() async{
    final snapshot = await firestore.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  }

