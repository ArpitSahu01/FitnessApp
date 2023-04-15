import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gfg_project/utils/extensions.dart';

import '../utils/app_utils.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List imageList = [
    {"id": 1, "image_path": "assets/carouselImages/carousel1.jpg"},
    {"id": 2, "image_path": "assets/carouselImages/carousel2.jpg"},
    {"id": 3, "image_path": "assets/carouselImages/carousel3.jpg"},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Quote",
          style: kPoppinsBold.copyWith(
              fontSize: 12.0.sp, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 2.0.hp,),
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                carouselController: carouselController,
                items: imageList
                    .map((item) => Image.asset(
                  item["image_path"],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
                    .toList(),
                options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index,reason){
                      setState(() {
                        currentIndex = index;
                      });
                    }
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                top: 16.0.hp,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: currentIndex == entry.key ? 17:7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key ? Colors.black.withOpacity(0.6):Colors.black.withOpacity(0.4),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      ],
    );
  }
}
