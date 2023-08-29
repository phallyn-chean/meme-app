import 'package:flutter/material.dart';
import 'package:meme_app/models/cart_card_models.dart';

class MemeCartProvider extends ChangeNotifier {
  final List<CartCardModels> _cartList = <CartCardModels>[];
  List<String>? memeIdList = <String>[];

  List<CartCardModels> get getCardList {
    return _cartList;
  }

  List<String>? get getMemesIdList {
    return memeIdList;
  }

  void addItem(CartCardModels addThisItem) {
    _cartList.add(addThisItem);
    notifyListeners();
  }

  void removeItem(String memeId) {
    _cartList.removeWhere((element) {
      return element.id == memeId;
    });
    memeIdList!.remove(memeId);
    notifyListeners();
  }
}
