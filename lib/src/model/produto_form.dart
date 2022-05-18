import 'package:dio/dio.dart';

class ProdutoForm {
  String? nomeProduto, descricaoProduto;
  double? valorProdutoInCents;
  int? qtdEstoque;
  String? dataValidadeProduto;
  String? gtinProduto;
  MultipartFile? imageProduto;

  ProdutoForm(
      {this.nomeProduto,
      this.dataValidadeProduto,
      this.descricaoProduto,
      this.gtinProduto,
      this.qtdEstoque,
      this.valorProdutoInCents,
      this.imageProduto});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['nomeProduto'] = nomeProduto;
    json['descricaoProduto'] = descricaoProduto;
    json['valorProdutoInCents'] = valorProdutoInCents;
    json['qtdEstoque'] = qtdEstoque;
    json['dataValidadeProduto'] = dataValidadeProduto;
    json['gtinProduto'] = gtinProduto;
    json['imageProduto'] = imageProduto;
    return json;
  }
}
