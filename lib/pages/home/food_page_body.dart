import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/icon_text.dart';
import 'package:foodie/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

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
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
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
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
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
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Chinese Side'),
                    SizedBox(
                      height: Dimensions.height10,
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
                    SizedBox(
                      height: Dimensions.height20,
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
    return Column(
      children: [
        SizedBox(
          //In case of error in future try replacing sizedbox with container-
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: ((context, position) {
              return _buildPageItem(position);
            }),
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _curPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Popular'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const SmallText(
                  text: 'Food Pairing',
                ),
              ),
            ],
          ),
        ),
        //List of images and details

        //in case of any error in future try replacing sizedbox with container
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food0.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const BigText(
                                  text: 'Nutritious Fruit Meal in China'),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              const SmallText(
                                  text: 'With Chinese Characteristics'),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconText(
                                      icon: Icons.circle_sharp,
                                      text: 'Normal',
                                      iconColor: AppColors.iconColor1),
                                  IconText(
                                      icon: Icons.location_on,
                                      text: '1.7 km',
                                      iconColor: AppColors.mainColor),
                                  IconText(
                                      icon: Icons.access_time_rounded,
                                      text: '32 min',
                                      iconColor: AppColors.iconColor2),
                                ],
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
