import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_emporio/src/model/produto_form.dart';
import 'package:flutter_emporio/src/repository/product_repository.dart';

class ProductPageController extends ChangeNotifier {
  final ProductRepository _productRepository;
  bool isLoading = false;
  MultipartFile? imageProduct;
  String? nameProduct;
  ProductPageController(this._productRepository);

  Future<void> getImageProduct() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imageProduct = MultipartFile.fromBytes(result.files.single.bytes!,
          filename: result.files.single.name);
      nameProduct = result.files.single.name;
    }
    notifyListeners();
  }

  void clearImage() {
    imageProduct = null;
    nameProduct = null;
    notifyListeners();
  }

  Future<void> create(String name, String expirationDateString,
      String description, String gtin, String priceString, String estoque,
      {required Function onSucess, required Function onError}) async {
    isLoading = true;
    notifyListeners();
    priceString = priceString.replaceAll(',', '.');
    double price = double.parse(priceString);
    double priceInCents = price * 100;
    ProdutoForm produtoForm = ProdutoForm(
      nomeProduto: name,
      dataValidadeProduto: expirationDateString,
      descricaoProduto: description,
      gtinProduto: gtin,
      valorProdutoInCents: priceInCents,
      qtdEstoque: int.parse(estoque),
    );
    try {
      await _productRepository.create(produtoForm, imageProduct);
      onSucess('Produto criado!');
    } on DioError catch (erro) {
      String message =
          erro.response?.data['message'] ?? 'Conexão com o servidor falhou!';
      onError(message);
    } catch (e) {
      onError(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> update(int idProduto, String name, String expirationDateString,
      String description, String gtin, String priceString, String estoque,
      {required Function onSucess, required Function onError}) async {
    isLoading = true;
    notifyListeners();
    priceString = priceString.replaceAll(',', '.');
    double price = double.parse(priceString);
    double priceInCents = price * 100;
    ProdutoForm produtoForm = ProdutoForm(
      nomeProduto: name,
      dataValidadeProduto: expirationDateString,
      descricaoProduto: description,
      gtinProduto: gtin,
      valorProdutoInCents: priceInCents,
      qtdEstoque: int.parse(estoque),
    );
    try {
      await _productRepository.update(idProduto, produtoForm, imageProduct);
      onSucess('Produto atualizado!');
    } on DioError catch (erro) {
      String message =
          erro.response?.data['message'] ?? 'Conexão com o servidor falhou!';
      onError(message);
    } catch (e) {
      onError(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> deletePhotoProduct(
      int idProduto, Function onSucess, Function onError) async {
    notifyListeners();
    try {
      Response response =
          await _productRepository.deletePhotoProduct(idProduto);
      onSucess(response.data['message']);
    } on DioError catch (erro) {
      String message =
          erro.response?.data['message'] ?? 'Conexão com o servidor falhou!';
      onError(message);
    } catch (e) {
      onError(e.toString());
    }

    notifyListeners();
  }

  @override
  void dispose() {
    imageProduct = null;
    nameProduct = null;
    super.dispose();
  }
}
