import 'package:flutter/material.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/food/popular_food_details.dart';
import 'package:foodie/pages/food/recomended_food_details.dart';
import 'package:foodie/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import "package:foodie/helper/dependencies.dart" as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductCotroller>().getPopularProductList();
    Get.find<RecommendedProductCotroller>().getRecommendedProductList();
    return GetMaterialApp(
      //Use GetMaterial App instead of material app to use getx package
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainFoodPage(),
    );
  }
}
