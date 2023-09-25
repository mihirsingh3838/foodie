import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/data/api/api_client.dart';
import 'package:foodie/data/repository/popular_product_repo.dart';
import 'package:foodie/data/repository/recommended_product_repo.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductCotroller(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductCotroller(recommendedProductRepo: Get.find()));
}
