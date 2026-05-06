import 'package:day_2_book_service/models/product_model.dart';
import 'package:flutter/material.dart';

class BookMarkProvider extends ChangeNotifier {
  final List<ProductModel> _bookMarkServices = [];

  List<ProductModel> get bookMarkServices => _bookMarkServices;

  void toggleBookMark(ProductModel services) {
    if (_bookMarkServices.contains(services)) {
      _bookMarkServices.remove(services);
    } else {
      _bookMarkServices.add(services);
    }
    notifyListeners();
  }

  bool isbookMark(ProductModel services) {
    return _bookMarkServices.contains(services);
  }

  void deleteBookMark(int index) {
    _bookMarkServices.removeAt(index);
    notifyListeners();
  }
}
