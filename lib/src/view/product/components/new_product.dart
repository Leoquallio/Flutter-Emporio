import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/view/product/components/fields_new_product.dart';

import 'package:provider/provider.dart';

import '../../../controller/product_page_controller.dart';

class ProductPage extends StatefulWidget {
  final Produto? produto;
  const ProductPage({Key? key, this.produto}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductPageController? _productPageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _productPageController =
          Provider.of<ProductPageController>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        height: size.height * 0.6,
        width: size.width * 0.5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<ProductPageController>(
                builder: (context, _, __) => widget.produto?.urlImagemProduto !=
                        null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        height: size.height * 0.15,
                        width: size.width * 0.15,
                        child: Image.network(widget.produto!.urlImagemProduto!))
                    : null == _productPageController?.imageProduct
                        ? GestureDetector(
                            onTap: () =>
                                _productPageController?.getImageProduct(),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              height: size.height * 0.15,
                              width: size.width * 0.15,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              Text(_productPageController!.nameProduct!),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () =>
                                    _productPageController?.clearImage(),
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          ),
              ),
              Expanded(
                child: FieldsProductPage(produto: widget.produto),
              )
            ],
          ),
        ),
      ),
    );
  }
}
