import 'package:flutter/cupertino.dart';

import '../model/produto_model.dart';

class ProductController extends ChangeNotifier {
  List<Produto> products = [];
  bool isLoading = false;

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 4));
    products = [
      Produto(
          idProduto: 2,
          nomeProduto: "Coca",
          valorProduto: 5.52,
          dataValidadeProduto: DateTime.now().toString(),
          descricaoProduto: "Gostoso",
          gtinProduto: "514747",
          qtdEstoque: 5),
      Produto(
          idProduto: 5,
          valorProduto: 10.00,
          nomeProduto: "Coca Cola",
          dataValidadeProduto: DateTime.now().toString(),
          descricaoProduto: "Gostoso",
          gtinProduto: "54454545",
          qtdEstoque: 2)
    ];
    isLoading = false;
    notifyListeners();
  }
}
