import 'package:foodie/data/repository/recommended_product_repo.dart';
import 'package:foodie/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductCotroller extends GetxController {
  RecommendedProductCotroller({required this.recommendedProductRepo});
  final RecommendedProductRepo recommendedProductRepo;
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isloaded = true;
      update();
    } else {}
  }
}
