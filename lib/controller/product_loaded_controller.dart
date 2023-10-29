import 'dart:convert';

import 'package:e_commerce_app/utils/images.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:e_commerce_app/models/product_model.dart';

class ProductLoaded{
  Future<List<ProductModel>> loadProducts() async {
    final jsonString = await rootBundle.loadString(Images.products_model);
    final jsonData = json.decode(jsonString);
    final products =
    (jsonData as List).map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }
}