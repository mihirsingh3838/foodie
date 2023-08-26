import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/icon_text.dart';
import 'package:foodie/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

// Creating carousel which can be displayed for different food items
  Widget _buildPageItem(index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      var curScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var curScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var curScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/food0.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8
                    ),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Chinese Side'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SmallText(text: '4.5'),
                        const SizedBox(width: 10),
                        const SmallText(text: '1287'),
                        const SizedBox(width: 10),
                        const SmallText(text: 'comments'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconText(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1),
                        IconText(
                            icon: Icons.location_on,
                            text: '1.7 km',
                            iconColor: AppColors.iconColor1),
                        IconText(
                            icon: Icons.access_time_rounded,
                            text: '32 min',
                            iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //In case of error in future try replacing sizedbox with container-
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: ((context, position) {
          return _buildPageItem(position);
        }),
      ),
    );
  }
}
