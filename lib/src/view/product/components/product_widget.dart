import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/repository/product_repository.dart';
import 'package:flutter_emporio/src/utils/alerts.dart';
import 'package:flutter_emporio/src/view/product/components/fields_new_product.dart';

import 'package:provider/provider.dart';

import '../../../controller/product_page_controller.dart';
import '../../../controller/products_controller.dart';

class ProductWidget extends StatefulWidget {
  final Produto? produto;

  const ProductWidget({Key? key, this.produto}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Produto? produtoEdit;
  ProductsController? _productsController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
    _productsController =
        Provider.of<ProductsController>(context, listen: false);
    _productsController!.getAllProducts();
    produtoEdit =
        widget.produto != null ? Produto.copyWith(widget.produto) : null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProductPageController>(
      lazy: true,
      create: (context) => ProductPageController(
        Provider.of<ProductRepository>(context, listen: false),
      ),
      builder: (context, widget) => Dialog(
        child: SizedBox(
          height: size.height * 0.7,
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<ProductPageController>(
                  builder: (context, productPageController, __) => produtoEdit
                              ?.urlImagemProduto !=
                          null
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          height: size.height * 0.15,
                          width: size.width * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Image.network(produtoEdit!.urlImagemProduto!),
                                Positioned(
                                  right: 0.3,
                                  bottom: 0.3,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        produtoEdit!.urlImagemProduto = null;
                                        productPageController
                                            .deletePhotoProduct(
                                                produtoEdit!.idProduto!,
                                                (message) {
                                          _productsController?.getAllProducts();
                                          Alerts.showSucess(context,
                                              message: message);
                                        }, (error) {
                                          Alerts.showError(context,
                                              message: error);
                                        });
                                      });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                )
                              ],
                            ),
                          ))
                      : null == productPageController.imageProduct
                          ? GestureDetector(
                              onTap: () =>
                                  productPageController.getImageProduct(),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                height: size.height * 0.15,
                                width: size.width * 0.15,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.camera),
                                      SizedBox(height: 5),
                                      Text('Adicionar imagem')
                                    ]),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image),
                                Text(productPageController.nameProduct!),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () =>
                                      productPageController.clearImage(),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                ),
                Expanded(
                  child: FieldsProductPage(produto: produtoEdit),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
