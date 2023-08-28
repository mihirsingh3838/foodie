//Setting up a font style for small text so that same could be used everywhere in app
import 'package:flutter/material.dart';

// if error in future remove final from size and overflow
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

// if error in future remove const
  const SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
