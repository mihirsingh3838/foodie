import 'package:foodie/data/repository/cart_repo.dart';
import 'package:foodie/models/cart_model.dart';
import 'package:foodie/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartController({required this.cartRepo});

  final CartRepo cartRepo;
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(
        product.id!,
        () => CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
            ));
  }
}
