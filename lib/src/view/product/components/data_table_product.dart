import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/controller.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/utils/alerts.dart';
import 'package:provider/provider.dart';

import 'new_product.dart';

class DataTableProduct extends StatelessWidget {
  final List<Produto> produtos;
  final List<String> myMenuProduct = ['Visualizar', 'Deletar'];
  late final ProductsController? _productsController;
  late final Size? size;
  DataTableProduct({Key? key, required this.produtos}) : super(key: key);

  void onTapMenuProduct(String item, Produto product, BuildContext context) {
    switch (item) {
      case 'Visualizar':
        showDialog(
            context: context,
            builder: (context) => ProductPage(produto: product));
        break;
      case 'Deletar':
        _productsController?.deleteProduct(product.idProduto!, (message) {
          _productsController?.getAllProducts();
          Alerts.showSucess(context, message: message);
        }, (error) {
          Alerts.showError(context, message: error);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _productsController = Provider.of(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return DataTable(
      columnSpacing: size.width <= 1000 ? size.width * 0.07 : size.width * 0.07,
      columns: const [
        DataColumn(label: Text("Código")),
        DataColumn(label: Text("Nome")),
        DataColumn(label: Text("Valor")),
        DataColumn(label: Text("Qtd Estoque")),
        DataColumn(label: Text("Data de validade")),
        DataColumn(label: Text("")),
      ],
      rows: produtos
          .map((product) => DataRow(
                cells: [
                  DataCell(
                    Text(product.gtinProduto != null
                        ? product.gtinProduto.toString()
                        : ''),
                  ),
                  DataCell(
                    Text(product.nomeProduto != null
                        ? product.nomeProduto!
                        : ''),
                  ),
                  DataCell(
                    Text(product.valorProduto != null
                        ? 'R\$ ${product.valorProduto!}'
                        : ''),
                  ),
                  DataCell(
                    Text(product.qtdEstoque != null
                        ? product.qtdEstoque.toString()
                        : ''),
                  ),
                  DataCell(
                    Text(product.dataValidadeProduto != null
                        ? product.dataValidadeProduto.toString()
                        : ''),
                  ),
                  DataCell(
                    PopupMenuButton<String>(
                        onSelected: (value) =>
                            onTapMenuProduct(value, product, context),
                        itemBuilder: (BuildContext context) {
                          return myMenuProduct.map((String choice) {
                            return PopupMenuItem<String>(
                              child: Text(choice),
                              value: choice,
                            );
                          }).toList();
                        }),
                  )
                ],
              ))
          .toList(),
    );
  }
}
