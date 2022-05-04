import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/product_controller.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';
import 'package:flutter_emporio/src/view/widgets/custom_button_circular.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController? _productController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _productController =
          Provider.of<ProductController>(context, listen: false);
      _productController!.getAllProducts();
    });
  }

  @override
  void dispose() {
    _productController!.isLoading = false;
    _productController!.products = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
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
                    Consumer<ProductController>(
                      builder: (context, productController, _) =>
                          productController.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : productController.products.isEmpty
                                  ? Center(
                                      child: Image.asset(
                                        'assets/images/products_not_found.png',
                                        height: size.height * 0.5,
                                      ),
                                    )
                                  : DataTable(
                                      columnSpacing: size.width <= 1000
                                          ? size.width * 0.07
                                          : size.width * 0.07,
                                      columns: const [
                                        DataColumn(label: Text("Id")),
                                        DataColumn(label: Text("Nome")),
                                        DataColumn(label: Text("Valor")),
                                        DataColumn(label: Text("Quantidade ")),
                                        DataColumn(label: Text("")),
                                      ],
                                      rows: productController.products
                                          .map((product) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(product.idProduto !=
                                                            null
                                                        ? product.idProduto
                                                            .toString()
                                                        : ''),
                                                  ),
                                                  DataCell(
                                                    Text(product.nomeProduto !=
                                                            null
                                                        ? product.nomeProduto!
                                                        : ''),
                                                  ),
                                                  DataCell(
                                                    Text(product.valorProdutoInCents !=
                                                            null
                                                        ? 'R\$ ${product.valorProdutoInCents! / 1000}'
                                                        : ''),
                                                  ),
                                                  DataCell(
                                                    Text(product.qtdEstoque !=
                                                            null
                                                        ? product.qtdEstoque
                                                            .toString()
                                                        : ''),
                                                  ),
                                                  const DataCell(Icon(Icons
                                                      .arrow_forward_ios_outlined)),
                                                ],
                                              ))
                                          .toList()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.02),
                child: CustomButtonCircular(
                    size.height * 0.05, "Adicionar produto", () {}),
              )
            ],
          )
        ],
      ),
    );
  }
}
