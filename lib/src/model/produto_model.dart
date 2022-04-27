class Produto {
  String? nomeProduto, descricaoProduto;
  double? valorProduto;
  int? idProduto, qtdEstoque;
  String? dataValidadeProduto;
  String? gtinProduto;

  Produto(
      {this.idProduto,
      this.nomeProduto,
      this.dataValidadeProduto,
      this.descricaoProduto,
      this.gtinProduto,
      this.qtdEstoque,
      this.valorProduto});

  Produto.fromJson(Map<String, dynamic> json) {
    idProduto = json['idProduto'];
    nomeProduto = json["nomeProduto"];
    dataValidadeProduto = json['dataValidadeProduto'];
    descricaoProduto = json['descricaoProduto'];
    qtdEstoque = json['qtdEstoque'];
    valorProduto = json['valorProduto'];
    gtinProduto = json['gtinProduto'].toString();
  }
}
