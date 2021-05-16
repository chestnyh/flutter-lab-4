import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_application/dummy_data/product_list_json.dart';
import 'package:flutter_application/model/product.dart';
import 'package:flutter_application/network/api_service.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService apiService;

  List<Product> products;

  ProductProvider(this.apiService);

  void loadProductsFromBackend() async {
    products = <Product>[];
    try {
      Response response = await apiService.getProducts();
      var productJsonList = jsonDecode(response.body);
      for (var productJson in productJsonList) {
        products.add(Product.fromJson(productJson));
      }
      notifyListeners();
    } catch (e) {
      loadProductsFromJsonString();
      notifyListeners();
    }
  }

  void loadProductsFromJsonString() {
    products = <Product>[];
    var productJsonList = jsonDecode(productListJson);
    for (var productJson in productJsonList) {
      products.add(Product.fromJson(productJson));
    }
  }
}
