class Produto {
  String? nomeProduto, descricaoProduto;
  double? valorProdutoInCents;
  int? idProduto;
  int? qtdEstoque;
  String? dataValidadeProduto;
  String? gtinProduto;
  String? urlImagemProduto;

  Produto(
      {this.idProduto,
      this.nomeProduto,
      this.dataValidadeProduto,
      this.descricaoProduto,
      this.gtinProduto,
      this.qtdEstoque,
      this.valorProdutoInCents,
      this.urlImagemProduto});

  Produto.fromJson(Map<String, dynamic> json) {
    idProduto = json['idProduto'];
    nomeProduto = json["nomeProduto"];
    dataValidadeProduto = json['dataValidadeProduto'];
    descricaoProduto = json['descricaoProduto'];
    qtdEstoque = json['qtdEstoque'];
    valorProdutoInCents = json['valorProdutoInCents'];
    gtinProduto = json['gtinProduto'].toString();
    urlImagemProduto = json['urlImagemProduto'];
  }
}
