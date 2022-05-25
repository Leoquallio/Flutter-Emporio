import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/produto_model.dart';
import '../repository/product_repository.dart';

class ProductsController extends ChangeNotifier {
  final ProductRepository _productRepository;
  List<Produto> products = [];
  bool isLoading = false;
  bool isLoadingDelete = false;

  ProductsController(this._productRepository);

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

  Future<void> updateProduct(
      int idProduto, Function onSucess, Function onError) async {
    isLoadingDelete = true;
    notifyListeners();
    try {
      Response response = await _productRepository.delete(idProduto);
      onSucess(response.data['message']);
    } on DioError catch (erro) {
      String message =
          erro.response?.data['message'] ?? 'Conexão com o servidor falhou!';
      onError(message);
    } catch (e) {
      onError(e.toString());
    }
    isLoadingDelete = false;
    notifyListeners();
  }

  Future<void> deleteProduct(
      int idProduto, Function onSucess, Function onError) async {
    isLoadingDelete = true;
    notifyListeners();
    try {
      Response response = await _productRepository.delete(idProduto);
      onSucess(response.data['message']);
    } on DioError catch (erro) {
      String message =
          erro.response?.data['message'] ?? 'Conexão com o servidor falhou!';
      onError(message);
    } catch (e) {
      onError(e.toString());
    }
    isLoadingDelete = false;
    notifyListeners();
  }
}
