class ProdutoForm {
  String? nomeProduto, descricaoProduto;
  double? valorProdutoInCents;
  int? qtdEstoque;
  String? dataValidadeProduto;
  String? gtinProduto;

  ProdutoForm({
    this.nomeProduto,
    this.dataValidadeProduto,
    this.descricaoProduto,
    this.gtinProduto,
    this.qtdEstoque,
    this.valorProdutoInCents,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['nomeProduto'] = nomeProduto;
    json['descricaoProduto'] = descricaoProduto;
    json['valorProdutoInCents'] = valorProdutoInCents;
    json['qtdEstoque'] = qtdEstoque;
    json['dataValidadeProduto'] = dataValidadeProduto;
    json['gtinProduto'] = gtinProduto;
    return json;
  }
}
