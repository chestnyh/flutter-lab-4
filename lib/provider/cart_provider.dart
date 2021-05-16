import 'package:flutter/material.dart';
import 'package:flutter_application/model/product.dart';

class CartProvider extends ChangeNotifier {
  final carts = Map<Product, int>();

  void addToCart(Product product) {
    if (carts.keys.contains(product)) {
      carts[product] += 1;
    } else {
      carts[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (carts.keys.contains(product)) {
      if (carts[product] == 1) {
        carts.remove(product);
      } else {
        carts[product] -= 1;
      }
    }
    notifyListeners();
  }

  double getTotal() {
    double total = 0;

    carts.forEach((key, value) {
      total += key.price * value;
    });

    return total;
  }
}
