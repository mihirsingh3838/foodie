//Enabling media queries so that app could be used on various screens
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.782;
  static double pageViewContainer = screenHeight / 4.046;
  static double pageViewTextContainer = screenHeight / 7.419;

  //Dynamic height padding and margin
  static double height10 = screenHeight / 89.02;
  static double height15 = screenHeight / 59.34;
  static double height20 = screenHeight / 44.51;
  static double height30 = screenHeight / 29.67;
  static double height45 = screenHeight / 19.78;

  //Dynamic width padding and margin
  static double width10 = screenHeight / 89.02;
  static double width15 = screenHeight / 59.34;
  static double width20 = screenHeight / 44.51;
  static double width30 = screenHeight / 29.67;
  //static double width45 = screenHeight / 19.78;

  static double font20 = screenHeight / 44.51;

  static double radius15 = screenHeight / 59.35;
  static double radius20 = screenHeight / 44.51;
  static double radius30 = screenHeight / 29.67;

  //icon size
  static double iconSize24 = screenHeight / 37.09;
}
