import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gfg_project/controllers/auth_controller.dart';
import 'package:gfg_project/routes/routes.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../utils/app_utils.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/sign_in_button.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final getStorage = GetStorage();
  bool isLoading = false;
  String _selectedValue = "Male";
  final _genderController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<String> _genderList = [
    "Male",
    "Female",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.0.hp,
              ),
              Center(
                child: Container(
                  width: Get.width / 100 * 50,
                  child: Image.asset(
                    "assets/otherScreens/userdataScreen.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 6.0.hp,
              ),
              Center(
                child: SizedBox(
                  width: Get.width / 100 * 90,
                  child: Text(
                    "Let's complete your profile",
                    style: kPoppinsBold.copyWith(
                        fontSize: 20.0.sp,
                        color: TextBlackColor,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  width: Get.width / 100 * 90,
                  child: Text(
                    "It will help us to know more about you!",
                    style: kPoppinsBold.copyWith(
                      fontSize: 12.0.sp,
                      color: textFieldIconColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0.hp,
              ),

              // Dropdown Option
              Container(
                height: 12.0.wp,
                width: 80.0.wp,
                decoration: const BoxDecoration(
                  color: textFieldColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4.0.wp,
                    ),
                    const Icon(
                      Icons.supervisor_account_sharp,
                      color: textFieldIconColor,
                    ),
                    SizedBox(
                      width: 4.0.wp,
                    ),
                    Container(
                      width: 65.0.wp,
                      padding: EdgeInsets.only(bottom: 0.5.hp),
                      child: DropdownButtonFormField(

                        validator: (val){
                          if(val==null ){
                            return "Please some gender";
                          }
                          return null;
                        },
                        hint: const Text("Choose Gender"),
                        items: _genderList.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
                        onChanged: (value) {
                          setState(() {
                            _genderController.text = value.toString();
                          });
                        },
                        icon: const Icon(Icons.expand_more),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Container(
                  height: 12.0.wp,
                  width: 80.0.wp,
                  decoration: const BoxDecoration(
                    color: textFieldColor,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text = DateFormat("d/M/y")
                              .format(pickedDate);
                        });
                      }
                    },
                    child: TextFormField(
                       controller: _dateController,
                      validator: (value){
                         if(value == null){
                           return "Enter correct Birth Date";
                         }
                         return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Choose Birth Date",
                          hintStyle: TextStyle(color: textFieldIconColor),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: textFieldIconColor,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabled: false),
                    ),
                  )),
              SizedBox(
                height: 2.0.hp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 64.0.wp,
                      child: TextFormField(
                        validator: (value){
                          if(value == null){
                            return "Enter correct weight";
                          }
                          if(double.tryParse(value)== null){
                            return "Enter correct weight";
                          }
                          return null;
                        },
                        onSaved: (value){
                            _weightController.text = value as String;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: textFieldColor,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.monitor_weight,
                            color: textFieldIconColor,
                          ),
                          hintText: "Your Weight",
                          hintStyle: TextStyle(
                            fontSize: 4.0.wp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0.wp,
                    ),
                    Container(
                      width: 12.0.wp,
                      height: 12.0.wp,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            gradientColorDark,
                            gradientColorLight,
                          ])),
                      child: Text(
                        "KG",
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 64.0.wp,
                      child: TextFormField(
                        validator: (value){
                          if(value == null){
                            return "Enter correct weight";
                          }
                          if(double.tryParse(value)== null){
                            return "Enter correct weight";
                          }
                          return null;
                        },
                        onSaved: (value){
                            _heightController.text = value as String;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: textFieldColor,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.swap_vert,
                            color: textFieldIconColor,
                          ),
                          hintText: "Your Height",
                          hintStyle: TextStyle(
                            fontSize: 4.0.wp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0.wp,
                    ),
                    Container(
                      width: 12.0.wp,
                      height: 12.0.wp,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            gradientColorDark,
                            gradientColorLight,
                          ])),
                      child: Text(
                        "CM",
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : SignInButton(
                      title: "Next",
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            gradientColorLight,
                            gradientColorDark,
                          ]),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {

                            _formKey.currentState!.save();
                            final gender = _genderController.text;
                            final birthDate = _dateController.text;
                            final weight = _weightController.text;
                            final height = _heightController.text;
                            print(gender);
                            print(birthDate);
                            print(weight);
                            print(height);
                            setState(() {
                              isLoading = true;
                            });
                            await getStorage.write("userPersonalData", {
                              "gender" : gender,
                              "birthDate" : birthDate,
                              "weight" : double.parse(weight),
                              "height" : double.parse(height),
                            });

                            try{
                             await AuthController.instance.storeUserDetails(weight, height, gender, birthDate);
                            }catch (e){
                              getStorage.remove("userPersonalData");
                              Get.snackbar("Something went wrong", "data not stored",messageText: Text(e.toString()));
                            }

                            setState(() {
                            isLoading = false;
                          });
                          Get.offAllNamed(RoutesClass.home);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0.1.hp,
          width: 32.0.wp,
          color: LightBlackColor.withOpacity(0.3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
          child: Text(
            "or",
            style: kPoppinsMedium.copyWith(
              fontSize: 12.0.sp,
              color: LightBlackColor.withOpacity(0.6),
            ),
          ),
        ),
        Container(
          height: 0.1.hp,
          width: 32.0.wp,
          color: LightBlackColor.withOpacity(0.3),
        ),
      ],
    );
  }
}
