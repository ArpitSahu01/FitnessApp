import 'package:flutter/material.dart';
import 'package:gfg_project/utils/app_utils.dart';
import 'package:gfg_project/utils/extensions.dart';

class CommunityItem extends StatelessWidget {

  final String imageUrl;
  final String text;
  const CommunityItem({required this.imageUrl,required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30.0.hp,
            child: Image.asset(imageUrl,fit: BoxFit.cover,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 10.0.hp,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0.wp),topRight: Radius.circular(4.0.wp),)
              ),
            ),
          ),
          Positioned(
            bottom: 2.0.hp,
            right: 0,
            left: 8,
            child: Text(text,style: kPoppinsMedium.copyWith(
              color: Colors.white,
              fontSize: 4.0.wp,
            ),),
          )
        ],
      ),
    );
  }
}
