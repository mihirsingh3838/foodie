import 'package:flutter/material.dart';
import 'package:foodie/home/food_page_body.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'India', color: AppColors.mainColor),
                      const Row(
                        children: [
                          SmallText(
                            text: 'Allahabad',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.search,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
