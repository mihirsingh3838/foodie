import 'package:flutter/material.dart';


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
    this.color,
    this.overFlow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
