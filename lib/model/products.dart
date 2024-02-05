 import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  final Map<int, double> _productPrices = {};

  final List<int> _productItems = [];

  List<int> get items => _productItems;

  Map<int, double> get prices => _productPrices;

  Products() {
    for (int i = 1; i <= 100; i++) {
      _productPrices[i] = i * 10.0;
    }
  }

  void add(int itemNo) {
    _productItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _productItems.remove(itemNo);
    notifyListeners();
  }

  double getTotalAmount() {
    double totalAmount = 0.0;
    _productItems.forEach((itemNo) {
      if (_productPrices.containsKey(itemNo)) {
        totalAmount += _productPrices[itemNo]!;
      }
    });
    return totalAmount;
  }
}
