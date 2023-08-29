import 'package:flutter/material.dart';

class CartCounterProvider extends ChangeNotifier {
  int cartCount;
  CartCounterProvider({this.cartCount = 0});

  int get getCartCount {
    return cartCount;
  }

  void increment() {
    cartCount += 1;
    notifyListeners();
  }

  void decrement() {
    cartCount -= 1;
    notifyListeners();
  }
}
