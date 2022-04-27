import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Produto> products = [
    Produto(
        idProduto: 2,
        nomeProduto: "Coca",
        valorProduto: 5.52,
        dataValidadeProduto: DateTime.now().toString(),
        descricaoProduto: "Gostoso",
        gtinProduto: "514747",
        qtdEstoque: 5),
    Produto(
        idProduto: 5,
        valorProduto: 10.00,
        nomeProduto: "Coca Cola",
        dataValidadeProduto: DateTime.now().toString(),
        descricaoProduto: "Gostoso",
        gtinProduto: "54454545",
        qtdEstoque: 2)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorsApp.kSecondColor.withOpacity(0.5),
          ),
          height: size.height * 0.8,
          width: size.width <= 1000 ? size.width * 0.95 : size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                DataTable(
                    columnSpacing: size.width <= 1000
                        ? size.width * 0.07
                        : size.width * 0.1,
                    columns: const [
                      DataColumn(label: Text("Id")),
                      DataColumn(label: Text("Nome")),
                      DataColumn(label: Text("Valor")),
                      DataColumn(label: Text("Quantidade ")),
                      DataColumn(label: Text("")),
                    ],
                    rows: products
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
                                  Text(product.valorProduto != null
                                      ? 'R\$ ${product.idProduto}'
                                      : ''),
                                ),
                                DataCell(
                                  Text(product.qtdEstoque != null
                                      ? product.idProduto.toString()
                                      : ''),
                                ),
                                const DataCell(
                                    Icon(Icons.arrow_forward_ios_outlined)),
                              ],
                            ))
                        .toList()),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: products.length,
                //   itemBuilder: (context, index) => Card(
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(products[index].nomeProduto!),
                //           Text(products[index].valorProduto != null
                //               ? 'R\$ ${products[index].valorProduto.toString()}'
                //               : ''),
                //           Text(products[index].idProduto!.toString()),
                //           GestureDetector(
                //             child: const Icon(Icons.arrow_forward_ios_sharp),
                //           )
                //         ]),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
