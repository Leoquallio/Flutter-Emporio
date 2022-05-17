import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_emporio/src/model/produto_form.dart';
import 'package:flutter_emporio/src/repository/product_repository.dart';

class NewProductController extends ChangeNotifier {
  final ProductRepository _productRepository;
  MultipartFile? imageProduct;
  String? nameProduct;
  NewProductController(this._productRepository);

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
    DateTime expirationDate = DateTime.parse(expirationDateString);
    double price = double.parse(priceString);
    double priceInCents = price / 100;
    ProdutoForm produtoForm = ProdutoForm(
      nomeProduto: name,
      dataValidadeProduto: expirationDate,
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
  }

  @override
  void dispose() {
    imageProduct = null;
    nameProduct = null;
    super.dispose();
  }
}
