import 'package:foodie/data/repository/popular_product_repo.dart';
import 'package:foodie/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductCotroller extends GetxController {
  PopularProductCotroller({required this.popularProductRepo});
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("Got Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      update();
    } else {
      print("Problem here");
    }
  }
}
