class Produto {
  String? nomeProduto, descricaoProduto;
  int? valorProdutoInCents;
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
      this.valorProdutoInCents});

  Produto.fromJson(Map<String, dynamic> json) {
    idProduto = json['idProduto'];
    nomeProduto = json["nomeProduto"];
    dataValidadeProduto = json['dataValidadeProduto'];
    descricaoProduto = json['descricaoProduto'];
    qtdEstoque = json['qtdEstoque'];
    valorProdutoInCents = json['valorProdutoInCents'];
    gtinProduto = json['gtinProduto'].toString();
  }
}
