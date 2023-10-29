import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  RxList<ProductModel> addToArray = <ProductModel>[].obs;

  RxDouble totalPrice = 0.0.obs;

  addToCart({ProductModel? productModel, context}) {
    addToArray.add(productModel!);
  }

  removeToCart({ProductModel? productModel, context}) {
    addToArray.remove(productModel!);
  }

  clearAddToCart(){
      addToArray.clear();
  }
}
