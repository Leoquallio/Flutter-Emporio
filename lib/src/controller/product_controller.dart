import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/produto_model.dart';
import '../repository/product_repository.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository _productRepository;
  List<Produto> products = [];
  bool isLoading = false;

  ProductController(this._productRepository);

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _productRepository.getAllProducts();
      if (response.data.runtimeType == List) {
        products = (response.data as List)
            .map((product) => Produto.fromJson(product))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
