import 'package:foodie/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductCotroller extends GetxController {
  PopularProductCotroller({required this.popularProductRepo});
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      //_popularProductList.addAll(iterable);
      update();
    } else {}
  }
}
