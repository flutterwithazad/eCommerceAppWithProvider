import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  void addCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeCart(Map<String, dynamic> product) {
    cart.remove(product);

    notifyListeners();
  }
}
