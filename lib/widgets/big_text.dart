//Setting up a font style for big text so that same could be used everywhere in app
import 'package:flutter/material.dart';
import 'package:foodie/utils/dimensions.dart';

// if error in future remove final from size and overflow
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;

// if error in future remove const
  const BigText({
    super.key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overFlow = TextOverflow.ellipsis,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
