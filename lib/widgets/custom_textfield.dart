import 'package:flutter/material.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';


class CustomTextField extends StatefulWidget {

  final String hintText;
  final IconData icon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final bool isSuffixIcon;
  const CustomTextField({
    required this.hintText,
    required this.icon,
    this.textEditingController,
    this.validator,
    this.isSuffixIcon = false,
    Key? key
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.wp,
      height: 6.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 1.0.wp,vertical: 0.1.hp),
      decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(4.0.wp)
      ),      child: TextFormField(
      obscureText: isVisible,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        prefixIcon: Icon(widget.icon,color: textFieldIconColor,),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 4.0.wp,
        ),
        suffixIcon: widget.isSuffixIcon ? GestureDetector(
          onTap: (){
            setState(() {
              isVisible = !isVisible;
            });
          },
            child: isVisible ? const Icon(Icons.visibility_outlined,color: textFieldIconColor,): const Icon(Icons.visibility_off_outlined,color: textFieldIconColor,),
        ): null,
      ),
      controller: widget.textEditingController,
      validator: widget.validator,
    ),
    );
  }
}