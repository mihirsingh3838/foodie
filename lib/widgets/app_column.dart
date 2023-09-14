import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/icon_text.dart';
import 'package:foodie/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimensions.font26,),
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
                  iconColor: AppColors.mainColor),
              IconText(
                  icon: Icons.access_time_rounded,
                  text: '32 min',
                  iconColor: AppColors.iconColor2)
            ],
          )
        ],
      ),
    );
  }
}
