class Produto {
  String? nomeProduto, descricaoProduto;
  String? valorProduto;
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
      this.valorProduto,
      this.urlImagemProduto});

  Produto.copyWith(Produto? produto) {
    idProduto = produto?.idProduto;
    gtinProduto = produto?.gtinProduto;
    nomeProduto = produto?.nomeProduto;
    dataValidadeProduto = produto?.dataValidadeProduto;
    descricaoProduto = produto?.descricaoProduto;
    qtdEstoque = produto?.qtdEstoque;
    valorProduto = produto?.valorProduto;
    urlImagemProduto = produto?.urlImagemProduto;
  }

  Produto.fromJson(Map<String, dynamic> json) {
    idProduto = json['idProduto'];
    nomeProduto = json["nomeProduto"];
    dataValidadeProduto = json['dataValidadeProduto'];
    descricaoProduto = json['descricaoProduto'];
    qtdEstoque = json['qtdEstoque'];
    valorProduto =
        ((json['valorProdutoInCents'] / 100) as double).toStringAsFixed(2);
    gtinProduto = json['gtinProduto'].toString();
    urlImagemProduto = json['urlImagemProduto'];
  }
}
