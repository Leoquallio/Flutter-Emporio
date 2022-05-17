import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';

import 'new_product.dart';

class DataTableProduct extends StatelessWidget {
  final List<Produto> produtos;
  const DataTableProduct({Key? key, required this.produtos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DataTable(
      columnSpacing: size.width <= 1000 ? size.width * 0.07 : size.width * 0.07,
      columns: const [
        DataColumn(label: Text("Id")),
        DataColumn(label: Text("Nome")),
        DataColumn(label: Text("Valor")),
        DataColumn(label: Text("Estoque")),
        DataColumn(label: Text("")),
      ],
      rows: produtos
          .map((product) => DataRow(
                cells: [
                  DataCell(
                    Text(product.idProduto != null
                        ? product.idProduto.toString()
                        : ''),
                  ),
                  DataCell(
                    Text(product.nomeProduto != null
                        ? product.nomeProduto!
                        : ''),
                  ),
                  DataCell(
                    Text(product.valorProdutoInCents != null
                        ? 'R\$ ${product.valorProdutoInCents! * 100}'
                        : ''),
                  ),
                  DataCell(
                    Text(product.qtdEstoque != null
                        ? product.qtdEstoque.toString()
                        : ''),
                  ),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => NewProduct(produto: product));
                      },
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
