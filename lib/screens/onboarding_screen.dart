import 'package:flutter/material.dart';
import 'package:gfg_project/utils/extensions.dart';
import 'package:gfg_project/utils/app_utils.dart';

class OnBoaridngScreen extends StatefulWidget {
  const OnBoaridngScreen({Key? key}) : super(key: key);

  @override
  State<OnBoaridngScreen> createState() => _OnBoaridngScreenState();
}

class _OnBoaridngScreenState extends State<OnBoaridngScreen> {
  late PageController _pageController;

  var _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onBoardData.length,
                  controller: _pageController,
                  onPageChanged: (index){
                  setState((){
                    _pageIndex = index;
                  });
                  },
                  itemBuilder: (context, index) {
                    return onBoardContent(
                      title: onBoardData[index].title,
                      description: onBoardData[index].description,
                      image: onBoardData[index].image,
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
              child: Row(
                children: [
                  ...List.generate(onBoardData.length, (index) => Padding(
                    padding:  EdgeInsets.only(right: 0.6.wp),
                    child: dotIndicator(isActive: index == _pageIndex,),
                  ),
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          gradientColorLight,
                          gradientColorDark,
                        ]
                      )
                    ),
                    child: ElevatedButton(
                      style : ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            )
          ],
        ),
      ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    Key? key,
    this.isActive = false
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 2.0.hp : 1.0.hp,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? dotsColor : dotsColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class onBoardContent extends StatelessWidget {
  onBoardContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 100.0.wp,
          height: 52.0.hp,
          fit: BoxFit.cover,
        ),
        Spacer(),
        Text(
          title,
          style: kPoppinsRegular.copyWith(
            fontSize: 24.0.sp,
            color: TextBlackColor,
          ),
        ),
        Container(
          width: 80.0.wp,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: kPoppinsRegular.copyWith(
              fontSize: 12.0.sp,
              color: LightBlackColor,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class onBoard {
  String image, title, description;

  onBoard({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<onBoard> onBoardData = [
  onBoard(
      title: "Track your Goals",
      description:
          "Keep track of your goals and better try to achieve them with all the best features ar your home ",
      image: "assets/onBoarding/1.png"),
  onBoard(
      title: "Run For Fun",
      description:
      "Whether you are of professional runner or not running helps in building good metabolism",
      image: "assets/onBoarding/2.png"),
  onBoard(
      title: "Diet to Build",
      description:
      "Heathy mind can reside in a healthy body. To keep your body health you must eat healthy.",
      image: "assets/onBoarding/3.png"),
  onBoard(
      title: "Mindfulness",
      description:
      "The way is to way to meditate with montoring over your the app.",
      image: "assets/onBoarding/4.png"),
];
